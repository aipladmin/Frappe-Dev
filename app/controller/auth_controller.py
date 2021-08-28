from flask import session
from .models import db, Users, Creds
from flask_sqlalchemy import get_debug_queries
from datetime import datetime
import random
import string
from .controller import send_mail


class Auth_Verification:
    def password_generator(length):
        letters = string.digits
        return ''.join(random.choice(letters) for i in range(length))

    def user_check(emailid):
        try:
            data_exist = db.session.query(Users).filter_by(email=emailid).first()
            if not data_exist:
                new_user = Users(
                    email=emailid,
                    timestamp=datetime.now()
                )
                db.session.add(new_user)
                db.session.commit()
                uid = new_user.uid
            else:
                uid = data_exist.uid

            otp = int(Auth_Verification.password_generator(6))
            new_cred = Creds(
                uid=uid,
                otp=otp,
                timestamp=datetime.now()
            )
            db.session.add(new_cred)
            db.session.commit()
            deets = {'Emailid': emailid, 'Subject': 'OTP', 'OTP': otp}
            send_mail(**deets)
            session['emailid'] = emailid
            return {'Status': "Success"}
        except Exception as e:
            return {'Status': "Error - " + str(e)}

    def otp_check(emailid, otp):
        try:
            data_exist = db.session.query(Users, Creds).join(Creds).filter(Users.email == emailid, Creds.otp == otp).order_by(Users.timestamp.desc()).limit(1)
            print(len(data_exist))
            for x in data_exist:
                print(x.users_uid, x.users_email, x.creds_otp)
            # if not data_exist:
            #     return {'Status': "Invalid Emailid"}
            # else:
            #     if data_exist.otp == otp:
            #         return {'Status': "Success"}
            #     else:
            #         return {'Status': "Invalid OTP"}
        except Exception as e:
            return {'Status': "Error - " + str(e)}
