
# Java 9,10 migration demo

This repository is practical demonstration of a java 8 application migration to java 9 and java 10. The application used in this demonstration is an implementation of the CQRS pattern taken from [java-design-patterns](https://github.com/iluwatar/java-design-patterns).

The repository contains the following branches :

* [master](https://github.com/isabiq/java9-migration/tree/master) : cqrs application as extracted from java-design-patterns running under java 8.
* [java9-classpath](//github.com/isabiq/java9-migration/tree/java9-classpath) : cqrs running under java 9 in the classpath (the unamed module).
* [java9-module-v1](//github.com/isabiq/java9-migration/tree/java9-module-v1) : cqrs and its direct dependencies running as modules under java 9.
* [java9-module-v2](//github.com/isabiq/java9-migration/tree/java9-module-v2) : cqrs and its dependencies running as modules under java 9.
* [java10-classpath](//github.com/isabiq/java9-migration/tree/java10-classpath) : cqrs running under java 10 in the classpath (the unamed module).
* [java10-module-v1](//github.com/isabiq/java9-migration/tree/java10-module-v1) : cqrs and its direct dependencies running as modules under java 10.
* [jav10-module-v2](//github.com/isabiq/java9-migration/tree/java10-module-v2) : cqrs and its dependencies running as modules under java 10.

In each branch you'll find at least three scripts in the bin directory. Each script compiles and runs the application using a different way. One using the command line, the other using maven and the third as a docker image. You'll find also in the java 9 and java 10 branches a script which uses jlink to generate a dependency report and the module-info in the temp/ directory.


### About Migration
* Java 9  : Detailed steps can be found at : [A Practical Guide to Java 9 Migration](https://dzone.com/articles/a-practical-guide-to-java-9-migration).
* Java 10 : Migration to Java 10 was made from the Java 9 branches respectively. The migration has been straightforward, just some minor upgrades.

### Environment

* Linux
* java "10"
* java "9.0.1"
* java "1.8.0_151"
* maven "3.5.3"
* docker 17.09.1-ce (optional: if you want to run CQRS as docker container)


Notice that for the master branch you'll need to configure JAVA_HOME for java 8. For the other branches you'll need to switch to java 9 or java 10.

### References

* [JEP 261: Module System](http://openjdk.java.net/jeps/261)
* [Java Platform, Standard Edition Oracle JDK 9 Migration Guide](https://docs.oracle.com/javase/9/migrate/toc.htm)
* [The State of the Module System](http://openjdk.java.net/projects/jigsaw/spec/sotms/)
* [Project Jigsaw: Module System Quick-Start Guide](http://openjdk.java.net/projects/jigsaw/quick-start)
* [Maven plugins](https://maven.apache.org/plugins/)
* [JDK 10](http://openjdk.java.net/projects/jdk/10/)


### Contributing

All suggestions, contributions and reactions are welcome.


