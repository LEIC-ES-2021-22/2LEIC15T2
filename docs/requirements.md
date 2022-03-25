## Requirements



### Use case model 


Example:
 <p align="center" justify="center">
  <img src="../images/UseCaseDiagram.png"/>
</p>

|||
| --- | --- |
| *Name* | Check List of Places |
| *Actor* |  Uni app User | 
| *Description* | The user can check all avaliable places |
| *Preconditions* | - The user is logged in UniFEUP. <br>|
| *Postconditions* | - The selected queue will be displayed <br>  |
| *Normal flow* | 1. The community acesses the system, by using FEUP's sigarra credentials.<br> 2. The system displays a list of supported places <br>|
| *Alternative flows and exceptions* | 1. [Filter] After step 2 the user can optionally choose to apply a filter to the results shown |

|||
| --- | --- |
| *Name* | Comment |
| *Actor* |  Uni app User | 
| *Description* | The user can leave a small message |
| *Preconditions* | - The user chooses a place <br>|
| *Postconditions* | - The message will be displayed <br>  |
| *Normal flow* | 1. The user chooses a place.<br> 2. The user leaves a message <br>|
| *Alternative flows and exceptions* | 1. [Filter] Some words might be filtered.

|||
| --- | --- |
| *Name* | Check Place Current State |
| *Actor* |  Uni app User | 
| *Description* | Shows the selected place queue and capacity |
| *Preconditions* | - The User has a place selected. <br>|
| *Postconditions* | - Nothing (only displays capacity) <br>  |
| *Normal flow* | 1. The user acesses the system, by using FEUP's sigarra credentials.<br> 2. The system displays a list of places<br> 3. The User selects a place.<br> 4 The system shows the selected place capacity and queue status<br>|
| *Alternative flows and exceptions* | 1. [No Capacity] If, in step 4 of the normal flow, the capacity feature is not support then it will not be displayed. <br> 2. [No Queue] If, in step 4 of the normal flow, the queue feature is not support then it will not be displayed.|

|||
| --- | --- |
| *Name* | Check Prediction |
| *Actor* |  Uni app User | 
| *Description* | Shows the predicted queue and/or capicity of the choosen place |
| *Preconditions* | - The User has a place selected. <br>|
| *Postconditions* | - Nothing (only displays the prediction) <br>  |
| *Normal flow* | 1. The user acesses the system, by using FEUP's sigarra credentials.<br> 2. The system displays a list of places<br> 3. The User selects a place.<br> 4 The system shows the selected place capacity and queue status<br>5.The User selects the prediction option <br> 6. The system shows the predicted queue and/or capicity of the choosen place of that day<br>|
| *Alternative flows and exceptions* | 1. [No Prediction] If, in step 6 of the normal flow, there isn't sufficient data then it will not be displayed. <br> |

|||
| --- | --- |
| *Name* | Check History |
| *Actor* |  Uni app User | 
| *Description* | Shows the previous states of queues |
| *Preconditions* | - The User has a place selected. <br>|
| *Postconditions* | - Nothing (only displays previous states) <br>  |
| *Normal flow* | 1. The user acesses the system, by using FEUP's sigarra credentials.<br> 2. The system displays a list of places<br> 3. The User selects a place.<br> 4 The system shows the selected queue previous states<br>|
| *Alternative flows and exceptions* | 1. [No History] If, in step 4 of the normal flow, there isn't sufficient data then it will not be displayed. <br> |


|||
| --- | --- |
| *Name* | Receive Notification (Form) |
| *Actor* |  Uni app User | 
| *Description* | Will give a form asking about the states |
| *Preconditions* | - The User reached a specific place <br>|
| *Postconditions* | - Nothing (only received the notification) <br>  |
| *Normal flow* | 1. The user checks the displayed information and will go to the place he desires.<br> 2. When he reaches a notification will be sent with a form<br>
| *Alternative flows and exceptions* | None

|||
| --- | --- |
| *Name* | Answer Form |
| *Actor* |  Uni app User | 
| *Description* | The User will answer a form  |
| *Preconditions* | - A notification was sent before<br>|
| *Postconditions* | - Displayed information will be updated <br>  |
| *Normal flow* | 1. The User will open the form<br> 2. Answer a form, to confirm and update information about capacity of places and state of queues<br>
| *Alternative flows and exceptions* | The user can answer the form at his own will, to update outdated information.

|||
| --- | --- |
| *Name* | Get Capacity |
| *Actor* |  Capacity API's | 
| *Description* | The API will provide us information to display  |
| *Preconditions* | - Check Place Current State <br>|
| *Postconditions* | - Displayed information will be updated <br>  |
| *Normal flow* | 1. The information in the App will be based on it's information<br>
| *Alternative flows and exceptions* | None

|||
| --- | --- |
| *Name* | Update Queue |
| *Actor* |  Uni App User| 
| *Description* | The information about Queue will be crowdsourced by the FEUP Community  |
| *Preconditions* | - Information is outdated <br>|
| *Postconditions* | - Displayed information will be updated <br>  |
| *Normal flow* | 1. The user sees a queue, the info is outdated<br> 2. Will Answer a form to update it<br>
| *Alternative flows and exceptions* | None





### User stories
This section will contain the requirements of the product described as **user stories**. 

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*

User stories should be created and described as [Issues](https://github.com/LEIC-ES-2021-22/templates/issues) in GitHub with the label "user story". See how to in the video [Creating a Product Backlog of User Stories for Agile Development using GitHub](https://www.youtube.com/watch?v=m8ZxTHSKSKE).

You should give a very short name to the issue and, in the "comments" field, add the user story itself (see above), the image(s) of the user interface mockup(s) (see below) and the acceptance test scenarios (see below). 

**INVEST in good user stories**. 
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines](https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/).

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in [Gherkin](https://cucumber.io/docs/gherkin/reference/)), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).



### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:
 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/templates/blob/main/images/DomainModel.png"/>
</p>
