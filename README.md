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
  This application is written in <code> rails 6.0.1 </code>. <br>
  Once you clone this application to your local envirmonment, you can run the following command in console to run the server: <br>
  <code> bundle install </code> <br>
  <code> rake db:create db:migrate </code> <br>
  <code> rails server </code> <br>
  You can also generate some sample datas for data model using <code> rake db:seed </code> <br>
<h3><span id='description'>Application Description</span></h3> 
<h5><span id='overview'>Overview</span></h5>
  This web application is used for <br>
  (1) user (guest) to signup(add guest), login/logout (create/destroy sessions), edit profile (edit guest), view all rooms, book room (assign guest to a room) and view/cancel current booking; <br>
  (2) admin to delete user (delete guest), add/edit/delete room and view all users and all bookings. Admin is also treated as a user.<br>
  <strong>The admin in the deployed app has email:admin@example.com, password:admin123.</strong>
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
   * <code>is_logged_in</code> show whether there's a login session; <br>
   * <code>current_user</code> if logged in, return the user currently logs in; <br> 
   With the help with these two functions, we can autherize the request with different conditions.
   <br><br>
<h3><span id='testplan'>Test plan</span></h3> 
  This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
