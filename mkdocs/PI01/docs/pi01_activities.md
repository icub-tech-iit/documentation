# attività del pi01



- documentazione
- migliorie meccaniche
- migliorie software
- diagnostica embedded



## documentazione

abbiamo pensato ad un modo semplice per permettere a tutti i ns progettisti di pubblicare le informazioni che via via produciamo con il ns lavoro.

Abbiamo quindi progettato questo sito [`iCub Tech Docs`](https://icub-tech-iit.github.io/documentation/mkdocs/thedocs/site/)  che ad ora contiene:

- documentazione di `cablaggio dei tendini di iCub`.
- gli `upgrade kit`.




## migliorie meccaniche

abbiamo lavorato sulle  segnalazioni  ns iCub Doctor. per alcune migliorie abbiamo previsto un upgrade kit. 

migliorie con upgrade kit:

- `mano di iCub`: evita il distacco di schede interne alla mano (MAIS, FTC).
- `supporto occhi di iCub`: migliora la precisione del posizionamento degli occhi e limita il disallineamento nella visione stereo.
- `condensatori torso di iCub`: prevede un supporto apposito che evita la caduta dei condensatori.
- `collo di iCub`: migliora il fissaggio del tendine del collo all'apposita puleggia


migliorie senza upgrade kit

- `cover del braccio di iCub`: risolve la rottura dei PCB flexi della pelle.
- `case di R1`: il nuovo contenitore accoglie anche la versione di R1 con la nuova mano.
- `viso di iTeen`:  il ns giovanotto ha finalmente un viso.


WIP

- `cavi torso iCub`: soluzione per facilitare la loro sostituzione e regolazione.
- `pulsante zainetto iCub`: soluzione per facilitare il montaggio. 



##  migliorie software

abbiamo lavorato alle seguenti attività:

- acquisizione di dati IMU per mezzo della scheda RFE.
- miglioramento delle espressioni facciali.
- whole body player


## diagnostica embedded

abbiamo ripensato a come gestire le informazioni di diagnostica provenienti dalle schede `ETH` del robot e da `yarprobotinterface`. 

ora esiste il `diagnostic daemon` che è sempre attivo e raccoglie informazioni di servizio direttamente dalle schede `ETH` nel robot ed anche da `yarprobotinrface`.  

il `diagnostic daemon` sarà il centro di smistamento per la diagnostica verso una GUI od un logger ad uso umano ed anche verso le app (vedi team DEV).


