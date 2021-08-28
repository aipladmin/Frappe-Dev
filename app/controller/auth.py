from flask import render_template, Blueprint, request, session
from datetime import timedelta, datetime
from .models import db, Users, Creds
from .auth_controller import Auth_Verification

auth = Blueprint('auth', __name__, template_folder='templates', static_folder='static',
                 static_url_path='/controller/static', url_prefix='/auth')


@auth.route('/auth')
def login():
    return render_template('auth/login.html')


@auth.route('/otp', methods=['POST'])
def get_otp():
    data = Auth_Verification.user_check(request.form['email'])
    print(data)
    if data['Status'] == 'Success':
        return render_template('auth/otp.html')
    else:
        return "INVALID1"


@auth.route('/validate/otp', methods=['POST'])
def validate_otp():
    data = Auth_Verification.otp_check(emailid=session.get('emailid'), otp=request.form['otp'])
    if data['Status'] == 'Success':
        "return render_template('auth/otp.html')"
    else:
        return "INVALID2"
