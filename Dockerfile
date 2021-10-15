FROM csminpp/ubuntu-sysbench
LABEL "about"="Automating sysbench test"
COPY sysbenchTestDocker.sh /sysbenchTest.sh
CMD ["/sysbenchTest.sh"]
