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

    ville_client = StringField("Ville", validators=[DataRequired()])
    rue_client = StringField("Rue", validators=[DataRequired()])
    numero_rue_client = StringField("N° de rue", validators=[DataRequired()])
    submit = SubmitField("Ajouter une nouvelle adresse")


class FormWTFUpdateGenre(FlaskForm):
    """
        Dans le formulaire "genre_update_wtf.html" on impose que le champ soit rempli.
        Définition d'un "bouton" submit avec un libellé personnalisé.
    """
    ville_client = StringField("Ville", validators=[DataRequired()])
    rue_client = StringField("Rue", validators=[DataRequired()])
    numero_rue_client = StringField("N° de rue", validators=[DataRequired()])
    submit = SubmitField("Modifié les données d'une adresse")
class FormWTFDeleteGenre(FlaskForm):
    """
        Dans le formulaire "genre_delete_wtf.html"

        nom_genre_delete_wtf : Champ qui reçoit la valeur du genre, lecture seule. (readonly=true)
        submit_btn_del : Bouton d'effacement "DEFINITIF".
        submit_btn_conf_del : Bouton de confirmation pour effacer un "genre".
        submit_btn_annuler : Bouton qui permet d'afficher la table "t_genre".
    """
    adresse_delete_wtf = StringField("Effacer ce client")
    submit_btn_del = SubmitField("Effacer le client")
    submit_btn_conf_del = SubmitField("Etes-vous sur de vouloir supprimer ce client ?")
    submit_btn_annuler = SubmitField("Annuler")
