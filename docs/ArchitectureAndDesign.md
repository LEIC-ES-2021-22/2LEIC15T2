## Architecture and Design

### Logical architecture

To structure our app we used the following diagram:


    

![LogicalArchitecture](/images/LogicalArchitecture.png)


* We placed the authentication information inside a component, which keeps user data, such as login, register and logout. 
* The system is able to send small form's to the user, in order to keep a constant real-time update on certain queues.
* Inside the FEUP GUI component, we placed all the visual interface which the user can see and interact.
* The request component keeps information about queues state, available capacity and queue prediction/history information about a certain place. We can also order the queues by distance from the user (nearest will come first!) 
* There are some external services that help our app receiving information about capacity's, such as parking lot and library, our app will fetch this data externally, and display it to the user. Also we will use google maps API to retrieve GPS positioning of the user.
* We will use a package which contains all information about a small chat, that users will use to send humanly messages about a queue. Also there is a report feature in order to keep a highly trust rate.
* System Logic receives all information from the packages above, and coordenates it with the FEUPQ server


### Final Logical architecture
![Final LogicalArchitecture](/images/LogicalArchitectureFinal.png)

* For our final delivery there were some changes, initially we wanted to create a small chat that could allow users to interact and send real-time written reports so other users could see. This feature was not implemented due to time/reliability.
* There was also a feature that consisted in the system sending us some notifications so we could manually report the status of a facility that we were in a few moments ago. Due to time it was not possible also to implement



### Physical architecture

To develop our app, we used the Flutter technology.
For the API's, we are using Google Maps API for GPS information.

![Physical Archi drawio](/images/PhysicalArchi.drawio.png)


* Our app will be used in the users smartphone (FEUP Community Phone), from there it will interact with the FEUPQ Server
* The FEUPQ UI will be developed in flutter and also interacts with the Logic Services such as Dart.
* We'll still have the external services, which were briefly described on the logical architecture.



### Vertical prototype

[As a member of the FEUP community, I want to check the queue status of a facility, so that I can plan ahead.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/3)

![queue](/images/facility_view.jpg)

[As a member of the FEUP community, I want to be able to check a specific facility available capacity, so that I can plan ahead my journey.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/1)

![available capacity](/images/facility_view2.jpg)

[As a member of the FEUP community, I want a way to report on a specific facility about its queue state, so that the community can also know about it.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/6)

![form](/images/form.jpg)




### Final Version - Design 

The main menu already integrated with the UNI app looks like this: 

![main window](https://user-images.githubusercontent.com/52889593/172940204-8cefc8eb-072d-41d7-ba6e-7ed4f4dc8491.jpg)



[As a member of the FEUP community, I want to check the queue status of a facility, so that I can plan ahead.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/3)

![queue](/images/cantina.jpg)


[As a member of the FEUP community, I want to be able to check a specific facility available capacity, so that I can plan ahead my journey.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/1)

![available capacity](/images/parque 1.jpg)

[As a member of the FEUP community, I want a way to report on a specific facility about its queue state, so that the community can also know about it.](https://github.com/LEIC-ES-2021-22/2LEIC15T2/issues/6)


![report window](https://user-images.githubusercontent.com/52889593/172940016-5bc47a36-0c66-491a-9b62-6ed3f48d7b4f.jpg)


The project ended with this visual interface, there was a improvement on functionalities but there is still some room for more improvement

