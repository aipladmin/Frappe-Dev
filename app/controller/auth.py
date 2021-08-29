from flask import render_template, Blueprint, request, session, redirect, url_for
from .auth_controller import Auth_Verification

auth = Blueprint('auth', __name__, template_folder='templates', static_folder='static',
                 static_url_path='/controller/static', url_prefix='/')


@auth.route('/')
@auth.route('/auth')
def login():
    return render_template('auth/login.html')


@auth.route('/otp', methods=['POST'])
def get_otp():
    if 'librarian' in request.form:
        data = Auth_Verification.user_check(request.form['email'], user_type='librarian')
    elif 'user' in request.form:
        data = Auth_Verification.user_check(request.form['email'], user_type='user')

    if data['Status'] == 'Success' and session['user_type'] == "librarian":
        return render_template('auth/otp.html')
    elif data['Status'] == 'Success' and session['user_type'] == "user":
        return redirect(url_for('user.user_index'))
    else:
        return "INVALID"


@auth.route('/validate/otp', methods=['POST'])
def validate_otp():
    data = Auth_Verification.otp_check(emailid=session.get('emailid'), otp=request.form['otp'])
    print(data)
    if data['Status'] == 'Success':
        return redirect(url_for('admin.index'))
    else:
        return "OTP Invalid"


@auth.route('/logout')
def logout():
    session.pop('emailid', None)
    session.pop('user_type', None)
    session.clear()
    return redirect(url_for('auth.login'))
