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
  This web application is used for (1) user (guest) to signup(add guest), login/logout (create/destroy sessions), edit profile (edit guest), view all rooms, book room (assign guest to a room) and view/cancel current booking; (2) admin to have any functions normal user has and admin can delete user (delete guest), add/edit/delete room and view all users and all bookings. 
<h5><span id='models'>Models</span></h5>
<h5><span id='controllers'>Controllers</span></h5>
<h5><span id='auth'>Authenication</span><h5>
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
