## Architecture and Design

### Logical architecture

To structure our app we used the following diagram:


    <insert professionally made diagram here>



* We placed the authentication information inside a component, which keeps user data, such as login, register and logout. 
* The system is able to send small form's to the user, in order to keep a constant real-time update on certain queues.
* Inside the FEUP GUI component, we placed all the visual interface which the user can see and interact.
* The request component keeps information about queues state, available capacity and queue prediction/history information about a certain place. We can also order the queues by distance from the user (nearest will come first!) 
* There are some external services that help our app receiving information about capacity's, such as parking lot and library, our app will fetch this data externally, and display it to the user. Also we will use google maps API to retrieve GPS positioning of the user.
* We will use a package which contains all information about a small chat, that users will use to send humanly messages about a queue. Also there is a report feature in order to keep a highly rate of trust.
* System Logic receives all information from the packages above, and coordenates it with the FEUPQ server



### Physical architecture

To develop our app, we used the Flutter technology. 


      <insert professionally made diagram here>

### Vertical prototype

      <It's a prototype because it's the first of its type, our monkey based team is still testing! Come back later!> 
