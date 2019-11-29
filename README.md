# README
## [Basic information](#basicInfo)
## [Application Description](#description)
   #### [Overview](#overview)
   #### [Models](#models)
   #### [Controllers](#controllers)
   #### [Authenication](#auth)
## [Test plan](#testplan)
<h3><span id='basicInfo'>Basic information</span></h3>
  This web application is deployed using heroku (Link: https://radiant-gorge-08960.herokuapp.com/). <br>
  This application is written in <code> rails 6.0.1 </code> with PostgreSQL. <br>
  Once you clone this application to your local envirmonment, you can run the following command in console to run the server: <br>
  <code> bundle install </code> <br>
  <code> rake db:create db:migrate </code> <br>
  <code> rails server </code> <br>
  You can also generate some sample datas for data model using <code> rake db:seed </code> <br>
  You may need to change the user/password for the database at <code> config/database.yml </code>
<h3><span id='description'>Application Description</span></h3> 
<h5><span id='overview'>Overview</span></h5>
  This web application is used for <br>
  (1) user (guest) to signup(add guest), login/logout (create/destroy sessions), edit profile (edit guest), view all rooms, book room (assign guest to a room) and view/cancel current booking; <br>
  (2) admin to delete user (delete guest), add/edit/delete room and view all users and all bookings. Admin is also treated as a user.<br>
  <strong>The admin in the deployed app has email:admin@gmail.com, password:admin123.</strong>
<h5><span id='models'>Models</span></h5>
   There are three models (User, Model, Booking) in this application: <br>
   <br>
   (1)<code>User: {</code><br>
      <code>name: string</code><br>
      <code>email: string</code><br>
      <code>password: string</code><br>
      <code>admin: boolean}</code><br>
   <br>   
   Where: <code>name</code> cannot be empty and cannot be too long;<br>
   <code>email</code> cannot be empty, cannot be too long, satisfies email format and is <strong>unique</strong>;<br>
   <code>password</code> length is at least 6;<br>
   <code>admin</code> it's set to false defaultly.<br>
   <br>
   (2)<code>Room: {</code><br>
      <code>num: integer</code><br>
      <code>info: string}</code><br>
   <br>   
   Where: <code>num</code> cannot be empty and is <strong>unique</strong>;<br>
   <code>info</code> cannot be too long.<br>
   <br>
   (3)<code>Booking: {</code><br>
      <code>user_id: integer</code><br>
      <code>room_id: integer}</code><br>
   <br>
   Where: <code>user_id</code> is the foreign key to <code>User</code>, and <code>room_id</code> is the foreign key to <code>Room</code>. 
    <br><br>
    (4) relation between three models:<br>
    <code>Booking</code> belongs to <code>User</code> and <code>Room</code>. <br>
    <code>User</code> has one <code>Booking</code>, and has one <code>Room</code> through <code>Booking</code>. <br>
    <code>Room</code> has one <code>Booking</code>, and has one <code>User</code> through <code>Booking</code>. <br>
    <br>
<h5><span id='controllers'>Controllers</span></h5>
    There're several controllers: <br>
    (1) static_pages <br>
    This one contains method <code>home</code>, which is used for <code>root</code> path.
    <br><br>
    (2) users <br>
    There're serveral methods:<br>
    <code>index</code>: used to show all users (admin only). <br>
    <code>new</code>: used for signup. You can submit a form for <code>create</code>. <br>
    <code>create</code>: used to create user and save to database. Redirect to <code>show</code> if creation successes. <br>
    <code>show</code>: used to show one user. <br>
    <code>edit</code>: used to edit profile. You can submit a form for <code>update</code>. <br>
    <code>update</code>: used to update user. Redirect to <code>show</code> if update successes. <br>
    <code>destroy</code>: used to delete user (admin only). Redicect to <code>index</code>. 
    <br><br>
    (2) sessions <br>
    sessions controller is used to record login/logout information of users. <br>
    There're serveral methods:<br>
    <code>new</code>: used for login. You can submit a form for <code>create</code>. <br>
    <code>create</code>: used to create session. Store <code>current_user</code> for authenication. <br>
    <code>destroy</code>: used to logout. Set <code>current_user</code> as <code>nil</code>
    <br><br>
    (3) rooms <br>
    There're serveral methods:<br>
    <code>index</code>: used to show all rooms. <br>
    <code>new</code>: used for add new room. You can submit a form for <code>create</code>. <br>
    <code>create</code>: used to create room and save to database. Redirect to <code>show</code> if creation successes. <br>
    <code>show</code>: used to show one room. <br>
    <code>edit</code>: used to edit room (admin only). You can submit a form for <code>update</code>. <br>
    <code>update</code>: used to update room (admin only). Redirect to <code>show</code> if update successes. <br>
    <code>destroy</code>: used to delete room (admin only). Redicect to <code>index</code>. 
    <br><br>
    (4) bookings <br>
    There're serveral methods:<br>
    <code>index</code>: used to show all bookings (admin only). <br>
    <code>new</code>: used for add new booking. You can choose rooms which is not  <br>
    <code>create</code>: used to create booking and save to database. Redirect to <code>new</code> if creation successes. <br>
    <code>show</code>: used to show one booking. <br>
    <code>destroy</code>: used to delete booking. Redicect to <code>current_user</code>. 
    <br><br>
<h5><span id='auth'>Authenication</span><h5>
   Firstly, to autherize the request, there're two helper functions in sessions controllers: <br>
   <code>is_logged_in</code> show whether there's a login session; <br>
   <code>current_user</code> if logged in, return the user currently logs in; <br> 
   With the help with these two functions and <code>before_action</code>, we can autherize the request with different conditions.
   <br><br>
   (1) Users:
   The authenications are:
   <code> before_action :logged_in_user, only:[:index, :show, :edit, :update, :destroy] </code> <br>
   <code> before_action :correct_user, only:[:edit, :update] </code> <br>
   <code> before_action :admin_user, only:[:index, :destroy] </code> <br>
   <code> before_action :correct_or_admin, only: :show </code>
   <br><br>
   Where:<br>
   <code>logged_in_user</code> will redirect to login path if the user is not logged in. You can view/edit/delete user only if you are logged in; <br>
   <code> correct_user </code> will redirect to root if the current user is not same to the user. You can view/edit the user information only if you are exactly this user; <br>
   <code> admin_user </code> will redirect to root if current user is not the admin. You can veiw all users or delete user only if you are admin; <br>
   <code> correct_or_admin </code> will redirect to root if current user is not the admin and the current user is not same to the user. You can veiw user information if you are that user or you are admin.<br>
   <br>
   (2) Rooms:
   The authenications are:
   <code> before_action :logged_in_user </code> <br>
   <code> before_action :admin_user, only: [:new, :create, :edit, :update, :destroy] </code>
   <br><br>
   Where:<br>
   <code> logged_in_user </code> will redirect to login path if the user is not logged in. You cannot do anything with room unless you are logged in; <br>
   <code> admin_user </code> will redirect to root if current user is not the admin. You can add/edit/delete a room only if you are admin.<br>
   <br>
   (3) Bookings:
   The authenications are:
   <code> before_action :logged_in_user </code> <br>
   <code> before_action :not_booked, only: [:new, :create] </code> <br>
   <code> before_action :correct_user, only: :destroy </code> <br>
   <code> before_action :admin_user, only: :index </code>
   <br><br>
   Where:<br>
   <code> logged_in_user</code> will redirect to login path if the user is not logged in. You can add/delete a booking only if you are logged in; <br>
   <code> not_booked </code> is used when creating new booking. It prevents you to create a new booking if the room you are trying to book if the room is already booked (<code>!room.booking.nil?</code>); <br>
   <code> correct_user </code> is used when deleting a booking. It prevents you to delete a booking if the current user is not same to the user of this booking.
   <code> admin_user </code> will redirect to root if current user is not the admin. You can view all bookings only if you are admin.<br>
   <br>
<h3><span id='testplan'>Test plan</span></h3> 
   My plan to do test is as the following (see <code>spec/booking_model_spec.rb</code> as an example):<br>
   (1) Firstly, test whether a model/controller works normally for valid data/operation. <br>
       example: One booking should be valid if the user_id and room_id are present, valid and unique. <br>
   (2) Secondly, test whether a model/controller could deal with invalid data/operation properly. <br>
       example: One booking should be invalid if the user_id/room_id is not present/valid/unique. <br>
   (3) Finally, test the influence of any operation on model/controller to related model/controller. <br>
       example: Once the booking is deleted, the relation between the linked user/room should desapper; <br>
               Once the user/room is deleted, the user's/room's booking should also be deleted. <br>
