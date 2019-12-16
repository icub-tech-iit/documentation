# attività del pi01



## documentazione

abbiamo pensato ad un modo semplice per permettere a tutti i ns progettisti di pubblicare sul ns sito [`iCub Tech Docs`](https://icub-tech-iit.github.io/documentation/mkdocs/thedocs/site/) le informazioni che via via produciamo con il ns lavoro.

Abbiamo quindi progettato questo sito che ad ora contiene:

- documentazione di `cablaggio dei tendini di iCub`.
- gli `upgrade kit`.


## migliorie meccaniche

abbiamo effettuato svariate migliorie meccaniche su problemi segnalati dalle attività sul campo del ns iCub Doctor.


realizzati con upgrade kits:

- mano di iCub: supporto della scheda MAIS, dorsetto.
- occhi di iCub: supporto dei bulbi oculari.
- torso di iCub: supporto dei condensatori.
- collo di iCub: fissaggio dei tendini sulla puleggia


realizzati e propagati solo al CAD

- cover del braccio di iCub: posizionamento dei PCB flexi della pelle.
- case di R1: accoglie anche la versione con mano nuova.
- cover della faccia di iTeen: montata sul robot.


WIP

- cavi torso iCub: soluzione per facilitare la loro sostituzione e regolazione.
- pulsante zainetto iCub: soluzione per facilitare il montaggio. 


## diagnostica embedded

abbiamo ripensato come gestire le informazioni di diagnostica provenienti dalle schede `ETH` del robot e da `yarprobotinterface`. 

ora il `diagnostic daemon` raccoglie informazioni di diagnostica dalle schede `ETH` e da `yarprobotinrface` per mezzo di un canale sempre attivo che sarà in grado di colloquiare con le applicazioni.


##  migliorie software

abbiamo lavorato alle seguenti attività:

- acquisizione di dati IMU per mezzo della scheda RFE.
- miglioramento delle espressioni facciali.
- whole body player



