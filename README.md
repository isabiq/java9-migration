
# Java 9 migration demo

This repository is pratical demonstration of a java 8 application migration to java 9. The application used in this demonstration is an implementation of the CQRS pattern taken from [java-design-patterns](https://github.com/iluwatar/java-design-patterns).

There are four branchs in this repository:

* [master](https://github.com/isabiq/java9-migration/tree/master) : cqrs application as extracted from java-design-patterns running under java 8.
* [java9-classpath](//github.com/isabiq/java9-migration/tree/java9-classpath) : cqrs running under java 9 in the classpath (the unamed module).
* [java9-module-v1](//github.com/isabiq/java9-migration/tree/java9-module-v1) : cqrs and its direct dependencies running as a module under java 9.
* [java9-module-v2](//github.com/isabiq/java9-migration/tree/java9-module-v2) : cqrs and its dependencies running as a module under java 9.

In each branch you'll find at least three scripts in the bin directory. Each script compiles and runs the application using a different way. One using the command line, the other using maven and the third as a docker image. 


### Environment

* Linux
* java "9.0.1"
* java "1.8.0_151"
* maven 3.5.2
* docker 17.09.1-ce (optional: if you want to run CQRS as docker container)


Notice that for this master branch you'll need to configure JAVA_HOME for java 8. For the other branchs you'll need to switch to java 9.

### References

* [JEP 261: Module System](http://openjdk.java.net/jeps/261)
* [Java Platform, Standard Edition Oracle JDK 9 Migration Guide](https://docs.oracle.com/javase/9/migrate/toc.htm)
* [The State of the Module System](http://openjdk.java.net/projects/jigsaw/spec/sotms/)
* [Project Jigsaw: Module System Quick-Start Guide](http://openjdk.java.net/projects/jigsaw/quick-start)
* [Maven plugins](https://maven.apache.org/plugins/)


### Contributing

All suggestions, contributions and reactions are welcome.


