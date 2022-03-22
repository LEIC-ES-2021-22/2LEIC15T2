
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Use case model 


Example:
 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC15T2/blob/ccb3739cd8b9ae0ea4c8b092ed6931c5da583555/images/UseCaseDiagram.jpg"/>
</p>




|||
| --- | --- |
| *Name* | FeupQ System |
| *Actor* |  FEUP Community | 
| *Description* | The user can see queues available to choose and after choosing one, the user can comment on its current state, read other user's comments about it, see some prediction on how the queue will be or even check how the queue was in the past. After submitting a message regarding the state of a queue, the program will, after a while, send a survey asking about the current state of the queue, in order to refresh its state. |
| *Preconditions* | - The user is logged in UniFEUP. <br> - The queue has an empty predifined state. <br> - Not marked as a malicious user |
| *Postconditions* | - The user will be able to see his comment in the chat. <br> - The queue state is updated based on the user's message. <br>  |
| *Normal flow* | 1. The community acesses the system, by using FEUP's sigarra credentials.<br> 2. The system shows the list of queues in many places/departments.<br> 3. The community selects one option from the available ones.<br>  -The community can comment on the current status of the queue.<br> -The community can check the actual state on the queue<br> -The community can check predictions and its history.<br> 4. After some minutes, the system may send a quick survey/notification to the community in order to update the queue status. |
| *Alternative flows and exceptions* | 1. [Marked as troll]- If in step x or in step y a comment or message is posted by a user which is marked as a troll, then its answers/posts will be rejected.<br> 2. If wanted, a queue filter is available.  |

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
