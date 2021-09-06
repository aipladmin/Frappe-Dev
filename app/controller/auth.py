from flask import render_template, Blueprint, request, session, redirect, url_for
from flask.helpers import flash
from .auth_controller import Auth_Verification

auth = Blueprint('auth', __name__, template_folder='templates', static_folder='static',
                 static_url_path='/controller/static', url_prefix='/')


@auth.route('/')
def login():
    return render_template('auth/login.html')


@auth.route('/otp', methods=['POST'])
def get_otp():
    if 'librarian' in request.form:
        data = Auth_Verification.user_check(emailid=request.form['email'], user_type='librarian')
    elif 'user' in request.form:
        data = Auth_Verification.user_check(emailid=request.form['email'], user_type='user')

    if data['Status'] != 'Success':
        return "INVALID"

    session['emailid'] = data['Emailid']
    if data['user_type'] == "librarian":
        session['user_type'] = "librarian"
        session.permanent = True
        return render_template('auth/otp.html')
    if data['user_type'] == "user":
        session['user_type'] = "user"
        session.permanent = True
        return redirect(url_for('user.user_index'))


@auth.route('/validate/otp', methods=['POST'])
def validate_otp():
    data = Auth_Verification.otp_check(otp=request.form['otp'])
    if data['Status'] == 'Success':
        return redirect(url_for('admin.index'))
    else:
        return data


@auth.route('/logout')
def logout():
    session.pop('emailid', None)
    session.pop('user_type', None)
    return redirect(url_for('auth.login'))
