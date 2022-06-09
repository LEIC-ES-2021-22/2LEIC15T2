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

##### Implemented

- As a member of the FEUP community, I want to check a specific facility queue or available capacity predictions, so that i can properly plan ahead. 

- As a member of the FEUP community, I want to check the queue status of a facility, so that I can plan ahead.

- As a member of the FEUP community, I want to be able to filter the supported facilities list, so that I can quickly select a facility.

- As a member of the FEUP community, I want a way to report on a specific facility about its queue state, so that the community can also know about it.

- As a member of the FEUP community, I want to easily find the facility I'm looking for, so that I don't waste unnecessary time.

- As a member of the FEUP community, I want to be able to check a specific facility available capacity, so that I can plan ahead my journey.

##### Not implemented

- As a member of the FEUP community, I want to be able to login, so that I know who I'm talking with.
 
- As a member of the FEUP community, I want to report comments with false info, so that I can assure that the community chat is reliable.
 
- As a member of the FEUP community, I want to look for a specific facility past data, so that I can search for patterns.

- As a member of the FEUP community, I want a fast way to report on a specific facility about its queue state, so that the community can also know about it. 
 
- As a member of the FEUP community, I want to communicate with other users at a certain facility, so that i can attain info about the facility and its services.



### Domain model


 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC15T2/blob/dbb1018c6d36b0538f833260a96fcab2249bb828/images/DomainModel.drawio%20(1).png"/>
</p>

__Place__:  Representa a fila selecionada pelo utilizador<br>
__Capacity__:  Representa a capacidade máxima, os lugares livres e em uso do local selecionado. <br>
__DataPointPast__: Representa um historico do local selecionado, por data, capacidade utilizada e estado habitual da fila.<br>
__DataPointFuture__: Representa uma estimativa/previsão do estado das filas/capacidade do local, agrupado por dias da semana.<br>
__FEUP Community User__:  Utilizador da aplicação, engloba toda comunidade FEUP, este utilizador pode:<br>
       - Comentar : Colocar comentários sobre o estado atual de um local num chat.<br>
       - Reportar : O utilizador pode reportar certos comentários, que não se enquadrem com a realidade atual do local/fila.<br>
       - Notificação/Inquérito: O utilizador pode responder a um pequeno inquérito sobre o estado atual da fila de um certo local, permitindo uma atualização em tempo real do seu estado.<br>

