"""
    Fichier : gestion_genres_wtf_forms.py
    Auteur : OM 2021.03.22
    Gestion des formulaires avec WTF
"""
from flask_wtf import FlaskForm
from wtforms import StringField, DateField, IntegerField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, DataRequired
from wtforms.validators import Regexp


class FormWTFAjouterGenres(FlaskForm):
    """
        Dans le formulaire "genres_ajouter_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    nom_genre_regexp = "^([A-Z]|[a-zÀ-ÖØ-öø-ÿ])[A-Za-zÀ-ÖØ-öø-ÿ]*['\- ]?[A-Za-zÀ-ÖØ-öø-ÿ]+$"
    #nom_genre_wtf = StringField("Taper le nom du model de la chaussure", validators=[Length(min=2, max=20, message="min 2 max 20"),
     #                                                              Regexp(nom_genre_regexp,
      #                                                                    message="Pas de chiffres, de caractères "
       #                                                                           "spéciaux, "
        #                                                                          "d'espace à double, de double "
         #                                                                         "apostrophe, de double trait union")
          #                                                         ])

    prenom_client = StringField("Prénom du client", validators=[DataRequired()])
    nom_client = StringField("Nom du client", validators=[DataRequired()])
    date_naissance_client = DateField("Date de naissance", validators=[DataRequired()])
    sexe_client = StringField("Sexe", validators=[DataRequired()])
    nationalite_client = StringField("Nationalité", validators=[DataRequired()])
    submit = SubmitField("Enregistrer le nouveau client")


class FormWTFUpdateGenre(FlaskForm):
    """
        Dans le formulaire "genre_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    modele_chaussure = StringField("Modèle chaussure", validators=[DataRequired()])
    taille_chaussures = IntegerField("Taille chaussure", validators=[DataRequired()])
    prix_chaussure = IntegerField("Prix chaussure", validators=[DataRequired()])
    submit = SubmitField("Update model")


class FormWTFDeleteGenre(FlaskForm):
    """
        Dans le formulaire "genre_delete_wtf.html"

        nom_genre_delete_wtf : Champ qui reçoit la valeur du genre, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "genre".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_genre".
    """
    chaussure_delete_wtf = StringField("Effacer ce model")
    submit_btn_del = SubmitField("Effacer le model")
    submit_btn_conf_del = SubmitField("Etes-vous sur de vouloir supprimer ce model ?")
    submit_btn_annuler = SubmitField("Annuler")
