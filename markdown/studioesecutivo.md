---
author:
- Luca Rossicone, Filippo Iacobelli
bibliography:
- sitografia.bib
title: Studio Esecutivo
---

# Julia Artifacts 

Gli artefatti[@artifacts] in Julia esistono sotto forma di un modulo
all'interno del modulo Pkg chiamato Pkg.Artifacts. Si accede alla
funzionalità nel REPL tramite:

        julia> using Pkg.Artifacts    

Se inserire immagini, file binari, set di dati e dati simili nei
repository git fosse indolore e senza problemi, potremmo non aver
bisogno di Artifacts.\
Il problema è che per i file binari i requisiti di spazio possono
diventare folli abbastanza rapidamente. Compilare una versione per ogni
piattaforma, 32-bit, 64-bit e una moltitudine di altre varianti e
mantenerla nella libreria del codice sorgente significherebbe un
disastro. Ci vorrebbe troppo spazio.\
Con Artifacts, più pacchetti potrebbero in linea di principio utilizzare
gli stessi dati e non è necessario scaricarli due volte. Facciamo conto
che il pacchetto A e il pacchetto B, entrambi dipendono dalla libreria
Qt. La soluzione fittizia a questo è che entrambe le librerie
memorizzino una copia di Qt.\
Bisognerebbe quindi scaricare un'enorme libreria due volte sprecando il
doppio dello spazio sul disco rigido. Non è una buona soluzione. Ora
qualcun altro potrebbe pensare di essere intelligente e archiviare Qt in
una directory condivisa per entrambi i pacchetti da usare. Vari sistemi
operativi lo hanno fatto all'inizio e hanno creato la cosa divertente
che chiamiamo \"inferno DLL\". Ciò accade quando la versione Qt
richiesta non è proprio la stessa. La versione scaricabile Qt potrebbe
funzionare per A, ma non per B.\
Git ha reso popolare una soluzione a questo enigma chiamato dati
indirizzabili al contenuto. Ciò significa che non localizzano i dati
fornendo percorsi come `A/libs/Qt`, ma usiamo invece degli hash.\
In questo caso, ogni byte dei binari della libreria Qt viene inserito in
un algoritmo di hashing e crea un numero univoco, l'hash. In teoria,
ovviamente, non è possibile garantire che due set di dati producano hash
diversi. La possibilità che diversi set di dati producano lo stesso hash
è simile a quella di due persone in posizioni casuali sulla terra che
raccolgono lo stesso granello di sabbia. Potrebbe succedere, ma è
improbabile.\
Il sistema di pacchetti Julia può quindi verificare se una libreria è
stata già installata controllando se esiste già una directory con un
hash ed evitare di scaricare la stessa libreria una seconda volta.

# Thread

Un thread è un singolo flusso sequenziale di controllo all'interno di un
programma. [@threads]\
La vera eccitazione che circonda i thread non riguarda un singolo thread
sequenziale. Piuttosto, si tratta dell'uso di più thread in esecuzione
contemporaneamente ed eseguire attività diverse in un unico programma.
Questo uso è illustrato nella figura successiva.\
Un browser Web è un esempio di applicazione multithread. All'interno di
un browser tipico, puoi scorrere una pagina mentre sta scaricando
un'applet o un'immagine, riprodurre animazioni e suoni
contemporaneamente, stampare una pagina in background mentre scarichi
una nuova pagina o guardare tre algoritmi di ordinamento che corrono
verso il traguardo.\
Alcuni testi chiamano un thread un processo leggero. Un thread è simile
a un processo reale in quanto entrambi hanno un unico flusso sequenziale
di controllo. Tuttavia, un thread è considerato leggero perché viene
eseguito nel contesto di un programma completo e sfrutta le risorse
allocate per quel programma e l'ambiente del programma.

# Tasks

L'approccio Python mette le coroutine dappertutto, prevedendole come
argomenti, ad esempio. [@tasks]\
Nelle API Julia raramente è necessario fornire direttamente un oggetto
attività. Sebbene possa essere soggettivamente influenzato dalla mia
esperienza più lunga con Julia, non posso fare a meno di sentire che le
API Python in quest'area sono molto più difficili da capire.\
Per fare un confronto, ho visto come questo viene fatto nel linguaggio
di programmazione Go. Questo mostra il codice con una logica molto
simile a quella del nostro esempio Julia.
