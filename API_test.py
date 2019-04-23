#!/usr/bin/env python
from flask import Flask, request, make_response
from flask import jsonify
import pymysql
import datetime
import json
import hashlib
# from DBmanager import DatabaseManager

app = Flask(__name__)
host = "127.0.0.1"
user = "root"
password = ""
db = "sharedhome"


def paymentgateway(user_id):
    approval_status = 0
    print("this is a dummy payment gateway simulator!!!")
    print("payment is being processed for "+ user_id )
    time_now = datetime.datetime.now()
    time_structured = time_now.strftime("%Y-%m-%d %H:%M:%S")
    key = time_structured[18]
    print("key:" +key)
    print(time_structured)
    if key == 1:
        approval_status = 0
        return approval_status
    else:
        approval_status = 1
        return approval_status




@app.route('/room_info', methods=['POST'])                
def room_info():
    conn = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
    cursor  = conn.cursor()
    cursor2 = conn.cursor()
    cursor3 = conn.cursor()
    
    apartment_id    = request.form['apartment_id']

    # sql1 = "SELECT user_id FROM user_profile WHERE user_id = %s"
    try:
        sql1 = "SELECT room_info.room_uniq_id as room, room_info.room_washroom_no, room_info.room_kitchen_no, room_info.room_amenity AS facility FROM bed_info INNER JOIN room_info ON bed_info.room_uniq_id = room_info.room_uniq_id WHERE bed_info.apartment_uniq_id = %s GROUP BY room_info.room_uniq_id"
        cursor.execute(sql1, apartment_id)

    except Exception as e:
        print(e)
        res={"response": "Query error"}
        return jsonify(res)

    rooms = cursor.fetchall()
    room_data = json.dumps(rooms)
    room_data2 = json.loads(room_data)

    for roomall in room_data2:
        room = roomall["room"]
        sql2 = "SELECT `room_uniq_id` as room FROM `bed_info` WHERE `room_uniq_id` = %s AND `bed_status` = 0" 
        cursor2.execute(sql2,room)
        roomall["no_of_room_available"] = cursor2.rowcount

        sql3 = "SELECT `room_uniq_id` as room FROM `bed_info` WHERE `room_uniq_id` = %s AND `bed_status` = 1" 
        cursor3.execute(sql3,room)
        roomall["no_of_room_booked"] = cursor3.rowcount

        
    # res={room_data2}
    return jsonify(room_data2)



@app.route('/editprofile', methods=['POST'])                
def editprofile():
    login_id 	= request.form['user_id']
    gender	 	= request.form['gender']
    occupation	= request.form['occupation']
    job_title   = request.form['job_title']
    organization= request.form['organization']
    religion	= request.form['religion']
    nationality	= request.form['nationality']
    national_id = request.form['national_id']
    food_choice = request.form['food_choice']
    passport    = request.form['passport_no']    
    address     = request.form['address']
    permanent_address   = request.form['permanent_address']
    rent_from   = request.form['rent_from']
    rent_to     = request.form['rent_to']
    verify_photo= request.form['verify_photo'] 
	# status		= 3
    # fcm_reg_id	= request.form['fcm_reg_id']
    # created_at	= request.form['created_at']
    # modified_at	= request.form['modified_at']
    # created_by	= request.form['created_by']
    # modified_by	= request.form['modified_by']
    dob         = request.form['dob']
    # secondary_email	= request.form['secondary_email']
    emergency_contact	= request.form['emergency_contact']
    time_now = datetime.datetime.now()
    time_structured = time_now.strftime("%Y-%m-%d %H:%M:%S")
    modified_by = request.form['modified_by']



    conn = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    
    if request.form['user_id'] != "":
        sql1="UPDATE user_profile SET user_address=%s,user_passport_no=%s,user_religion=%s, user_foodchoice=%s,user_gender=%s,user_nationality=%s, user_birthday=%s,user_national_id=%s,user_rent_to=%s,user_rent_from=%s,user_organization=%s,user_job_title=%s, user_permanent_address=%s,user_emergency_contact=%s,user_photo_in_string=%s,user_modified_by=%s WHERE user_id = %s"
        
        try:
            cursor.execute(sql1,(address, passport, religion, food_choice, gender, nationality, dob, national_id, rent_to, rent_from, organization, job_title, permanent_address, emergency_contact, verify_photo, modified_by, login_id))
            conn.commit()

        except Exception as e:
            print (e)

        cursor.close()
        conn.close() 
        res={"response": "USER edited"}
        return jsonify(res)
            
            
    else:
        res={"response": "Required field is empty!!!"}


@app.route('/onoff', methods=['POST'])                
def onoff():
    comm_type    = request.form['communication']
    device_id    = request.form['did']
    dev_status    = request.form['status']
    dev_updated_by    = request.form['updated_by']
    
    conn = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    
    if comm_type != "" and device_id != "" and dev_status != "":
        if comm_type == "mqtt" or comm_type == "MQTT":
            print("Implement mqtt functionality fast!!!")
            #mqtt function calling
        else:
            print("mqtt operation is not reqiuired")

        # sql_update = "UPDATE ac_control SET dev_status=%s WHERE dev_id=%s"
        sql = "UPDATE device_table SET device_status = %s, device_updated_by = %s WHERE device_id = %s"

        try:
            cursor.execute(sql,(dev_status, dev_updated_by, device_id))
            conn.commit()
        except Exception as e:
            print (e)
        cursor.close()
        conn.close()          
        return jsonify("response: device status updated!!!")                
            
    else:
        res={"response": "Required field is empty!!!"}


@app.route('/apartment_list', methods=['POST'])                
def apartment_list():
    location    = request.form['location']
    
    conn = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    
    if request.form['location'] != "":
        sql="SELECT `apartment_name`, `apartment_address` as address, `apartment_contact` as contact, `apartment_image` as image_url, `apartment_avg_price` as avg_fare, `apartment_rating` as rating, `apartment_no_of_room` as no_of_room, `apartment_description` as description FROM `apartment_table` WHERE `apartment_location` = %s"
        try:
            cursor.execute(sql,(location))
        except Exception as e:
            print (e)
        except KeyError:
            return json("Wrong Key given")
        if(cursor.rowcount>0):
            users = cursor.fetchall()

            user_data = json.dumps(users)
            user_data2 = json.loads(user_data)

            # for userall in user_data2:
            #     if userall["user_id"] == userid and userall["pass"] == encrypt_pass and userall["approval"] == 1 :
            #         res={"response":{"response": "Successfully Logged in"},"branch": {"branch": userall["branch_name"]}}

            #         cursor.close()
            #         conn.close()
            approval = paymentgateway(location)

            print("Approval from payment gateway:")
            print(approval)
                    
            return jsonify(user_data2)
        else:
            # res={"response":"Admin approval required"}
            res = {"response": "Sorry!!! No hotels found"}
            return jsonify(res)              
            
    else:
        res={"response": "Required field is empty!!!"}



if __name__ == '__main__':
    app.run(debug=True,host= '0.0.0.0', port='5000')


