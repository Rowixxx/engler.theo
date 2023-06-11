from pathlib import Path
from flask_wtf import FlaskForm
from wtforms import StringField, DateField, SelectField, TextAreaField, BooleanField, SelectMultipleField
from wtforms import SubmitField
from wtforms.validators import Length, InputRequired, DataRequired
from wtforms.validators import Regexp

from APP_FILMS_164 import app
from APP_FILMS_164.database.database_tools import DBconnection
from APP_FILMS_164.erreurs.exceptions import *


class FormWTFAcheterChaussure(FlaskForm):
    select_chaussure_wtf = SelectField("Sélectionner la chaussure (liste déroulante)",
                                  validate_choice=False, coerce=int)

    select_personne_wtf = SelectField("Sélectionner la personne (liste déroulante)",
                                  validate_choice=False, coerce=int)

    submit = SubmitField("Enregistrer")


class FormWTFUpdateAcheterChaussure(FlaskForm):
    select_pers_wtf = SelectField("Sélectionner la personne (liste déroulante)",
                                  validate_choice=False, coerce=int)

    select_chaussure_wtf = SelectField("Sélectionner la chaussure (liste déroulante)",
                                  validate_choice=False, coerce=int)

    #select_prenom_wtf = SelectField("Sélectionner le prenom (liste déroulante)",
     #                             validate_choice=False, coerce=int)

    #select_model_wtf = SelectField("Sélectionner le model(liste déroulante)",
      #                            validate_choice=False, coerce=int)

    submit = SubmitField("Enregistrer")