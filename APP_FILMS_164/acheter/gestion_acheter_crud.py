from pathlib import Path
from flask import render_template, session, redirect, url_for
from APP_FILMS_164 import app
from APP_FILMS_164.erreurs.msg_erreurs import *
from APP_FILMS_164.erreurs.exceptions import *
from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.acheter.gestion_acheter_wtf_forms import FormWTFAcheterChaussure, FormWTFUpdateAcheterChaussure
from flask import request


@app.route('/acheter_afficher/<string:order_by>/<int:id_sel>', methods=['GET', 'POST'])
def acheter_afficher(order_by, id_sel):
    if request.method == "GET":
        try:
            with DBconnection() as mc_afficher:
                if order_by == "ASC" and id_sel == 0:
                    strsql_genres_afficher = """SELECT pac.id_perso_acheter_chaussure, p.nom, p.prenom, pac.date_achat, c.model
                                FROM 
                                t_personne p
                                JOIN 
                                t_pers_acheter_chaussure pac ON p.id_perso = pac.fk_pers_id
                                JOIN 
                                t_chaussure c ON pac.fk_chaussure_id = c.id_chaussure
                                ORDER BY pac.id_perso_acheter_chaussure ASC;"""
                    mc_afficher.execute(strsql_genres_afficher)
                elif order_by == "ASC":
                    valeur_id_genre_selected_dictionnaire = {"id_sel": id_sel}
                    strsql_genres_afficher = """SELECT pac.id_perso_acheter_chaussure, p.nom, p.prenom, pac.date_achat, c.model
                                FROM 
                                t_personne p
                                JOIN 
                                t_pers_acheter_chaussure pac ON p.id_perso = pac.fk_pers_id
                                JOIN 
                                t_chaussure c ON pac.fk_chaussure_id = c.id_chaussure
                                WHERE id_perso_acheter_chaussure=%(id_sel)s;"""

                    mc_afficher.execute(strsql_genres_afficher, valeur_id_genre_selected_dictionnaire)
                else:
                    strsql_genres_afficher = """SELECT pac.id_perso_acheter_chaussure, p.nom, p.prenom, pac.date_achat, c.model
                                FROM 
                                t_personne p
                                JOIN 
                                t_pers_acheter_chaussure pac ON p.id_perso = pac.fk_pers_id
                                JOIN 
                                t_chaussure c ON pac.fk_chaussure_id = c.id_chaussure
                                ORDER BY pac.id_perso_acheter_chaussure DESC;"""

                    mc_afficher.execute(strsql_genres_afficher)

                data_personne_chaussure = mc_afficher.fetchall()

                print("data_genres ", data_personne_chaussure, " Type : ", type(data_personne_chaussure))

                # Différencier les messages si la table est vide.
                if not data_personne_chaussure and id_sel == 0:
                    flash("""La table est vide. !!""", "warning")
                elif not data_personne_chaussure and id_sel > 0:
                    # Si l'utilisateur change l'id_genre dans l'URL et que le genre n'existe pas,
                    flash(f"N'existe pas !!", "warning")
                else:
                    # Dans tous les autres cas, c'est que la table "t_genre" est vide.
                    # OM 2020.04.09 La ligne ci-dessous permet de donner un sentiment rassurant aux utilisateurs.

                    flash(f"Données personne chaussure affichés !!", "success")

        except Exception as Exception_afficher_achat:
            raise ExceptionGenresAfficher(f"fichier : {Path(__file__).name}  ;  "
                                          f"{acheter_afficher.__name__} ; "
                                          f"{Exception_afficher_achat}")

    return render_template('acheter/acheter_afficher.html', data=data_personne_chaussure)


@app.route('/acheter_ajouter_wtf', methods=['GET', 'POST'])
def acheter_ajouter_wtf():
    form = FormWTFAcheterChaussure()
    try:
        if request.method == 'GET':
            str_chaussure = """SELECT id_chaussure, model FROM t_chaussure;"""
            with DBconnection() as mc_equi:
                mc_equi.execute(str_chaussure)
            data_chaussure = mc_equi.fetchall()

            session['data_chaussure'] = data_chaussure

            chaussure_val_list_dropdown = [(i["id_chaussure"], i["model"]) for i in data_chaussure]

            form.select_chaussure_wtf.choices = chaussure_val_list_dropdown

            str_sql_pers = """SELECT id_perso, prenom, nom FROM t_personne;"""
            with DBconnection() as mc_tache:
                mc_tache.execute(str_sql_pers)
            data_pers = mc_tache.fetchall()

            session['data_pers'] = data_pers

            pers_val_list_dropdown = [(i["id_perso"], i["prenom"] + " " + i["nom"]) for i in data_pers]

            form.select_personne_wtf.choices = pers_val_list_dropdown

        elif request.method == 'POST':

            form.select_personne_wtf.choices = [(i["id_perso"], i["prenom"] + " " + i["nom"]) for i in
                                                session['data_pers']]
            form.select_chaussure_wtf.choices = [(i["id_chaussure"], i["model"]) for i in session['data_chaussure']]
            if form.validate_on_submit():
                pers_select_wtf = form.select_personne_wtf.data
                chaussure_select_wtf = form.select_chaussure_wtf.data

                print(pers_select_wtf)
                print(chaussure_select_wtf)

                valeurs_insertion_dictionnaire = {"id_pers": pers_select_wtf, "id_chaussure": chaussure_select_wtf, }

                strsql_insert_pers_chauss = f"""INSERT INTO t_pers_acheter_chaussure (fk_pers_id, fk_chaussure_id)
                                                VALUES
                                                (%(id_pers)s, %(id_pers)s)"""

                with DBconnection() as mconn_bd:
                    mconn_bd.execute(strsql_insert_pers_chauss, valeurs_insertion_dictionnaire)

                flash(f"Données insérées", "success")
                print(f"Données insérées")

                # Pour afficher et constater l'insertion de la valeur, on affiche en ordre inverse. (DESC)
                return redirect(url_for('acheter_afficher', order_by='DESC', id_sel=0))

    except Exception as Exception_controle_ajouter_wtf:
        raise ExceptionGenresAjouterWtf(f"fichier : {Path(__file__).name}  ;  "
                                        f"{acheter_ajouter_wtf.__name__} ; "
                                        f"{Exception_controle_ajouter_wtf}")

    return render_template('acheter/acheter_ajouter_wtf.html', form=form)


@app.route('/acheter_update', methods=['POST', 'GET'])
def acheter_update_wtf():
    id_pers_chauss_update = request.values['id_pers_chauss_btn_edit_html']
    form_update = FormWTFUpdateAcheterChaussure()
    try:
        if request.method == 'POST':
            form_update.select_pers_wtf.choices = [(i["id_perso"], i["prenom"], i["nom"]) for i in
                                                   session['data_pers']]
            form_update.select_chaussure_wtf.choices = [(i["id_chaussure"], i["model"]) for i in
                                                   session['data_chaussure']]
        if request.method == 'GET':
            str_sql_id_controle = """SELECT * FROM t_pers_acheter_chaussure
                                    WHERE id_perso_acheter_chaussure = %(id_pers_chauss_update)s"""
            valeur_select_dictionnaire = {"id_pers_chauss_update": id_pers_chauss_update}
            with DBconnection() as mc_controle:
                mc_controle.execute(str_sql_id_controle, valeur_select_dictionnaire)

            data_controle = mc_controle.fetchone()

            str_sql_pers = """SELECT id_perso, prenom FROM t_personne"""
            with DBconnection() as mc_pers:
                mc_pers.execute(str_sql_pers)
            data_pers = mc_pers.fetchall()
            session['data_personne'] = data_pers
            pers_val_list_dropdown = [(i["id_perso"], i["prenom"]) for i in data_pers]
            form_update.select_pers_wtf.choices = pers_val_list_dropdown
            form_update.select_pers_wtf.data = data_controle['fk_pers_id']

            str_sql_tache = """SELECT id_chaussure, model FROM t_chaussure"""
            with DBconnection() as mc_tache:
                mc_tache.execute(str_sql_tache)
            data_chaussure = mc_tache.fetchall()
            session['data_chaussure'] = data_chaussure
            tache_val_list_dropdown = [(i["id_chaussure"], i["model"]) for i in data_chaussure]
            form_update.select_chaussure_wtf.choices = tache_val_list_dropdown
            form_update.select_chaussure_wtf.data = data_controle['fk_chaussure_id']


        elif form_update.validate_on_submit():
            prenom = form_update.select_pers_wtf.data
            model = form_update.select_chaussure_wtf.data

            valeur_update_dictionnaire = {"value_id_perso_acheter_chaussure": id_pers_chauss_update,
                                          "value_prenom": prenom,
                                          "value_model": model,
                                          }

            # valeur_update_dictionnaire = {"value_id_controle": id_controle_update,
                                          # "value_name_equi": nom_equi,
                                         # "value_name_tache": nom_tache,
                                         # "value_indic_controle": indicateur_controle,
                                         # "value_commentaire_controle": commentaire_controle
                                         # }

            str_sql_update_controle = """UPDATE t_pers_acheter_chaussure SET fk_pers_id = %(value_prenom)s,
                         fk_chaussure_id = %(value_model)s
                         WHERE id_perso_acheter_chaussure = %(value_id_perso_acheter_chaussure)s """

           # str_sql_update_controle = """UPDATE t_tache_equi SET fk_equi = %(value_name_equi)s,
                                  #  fk_tache = %(value_name_tache)s, indicateur_tache = %(value_indic_controle)s,
                                   # commentaire_tache = %(value_commentaire_controle)s
                                   # WHERE id_tache_equi = %(value_id_controle)s """

            with DBconnection() as mconn_bd:
                mconn_bd.execute(str_sql_update_controle, valeur_update_dictionnaire)

            flash(f"Donnée mise à jour", "success")

            return redirect(url_for('acheter_afficher', order_by='DESC', id_sel=id_pers_chauss_update))

    except Exception as Exception_acheter_update_wtf:
        raise ExceptionGenreUpdateWtf(f"fichier : {Path(__file__).name}  ;  "
                                      f"{acheter_update_wtf.__name__} ; "
                                      f"{Exception_acheter_update_wtf}")

    return render_template("acheter/acheter_update_wtf.html", form_update=form_update)
