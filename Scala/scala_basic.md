# Scala basic 

### Hello, world!

- intelij에 스칼라 프로젝트 생성 후 src 폴더에 scala Class —> Object 파일을 생성한다. 

~~~scala
object HelloWorld {
  def main(args: Array[String]) {
    println("Hello, world!")
  }
}
~~~

- `main` 함수는 값을 돌려주지 않기 때문에 리턴타입을 선언할 필요가 없다.
- `main` 함수를 감싸고 있는 `object` 선언은 **싱글턴 객체**를 생성하는데, 이를 객체라고 하고 클래스의 유일한 인스턴스를 만들기 위해 사용한다. 따라서 위의 선언은 <u>`HelloWorld`라는 클래스와 역시 `HelloWorld`라고 이름 붙인 이 클래스의 인스턴스를 함께 정의 하는 것이다.</u> 이 인스턴스는 처음 사용 될 때에 필요에 따라 만들어 진다.
- `main` 함수는 `static`이 아니다. Scala에는 <u>정적 멤버(함수든 필드든)라는 개념이 아얘 존재하지 않는다</u>. 클래스의 일부로 정적 멤버를 정의하는 대신에 Scala 프로그래머들은 정적이기 원하는 멤버들을 싱글턴 객체[^싱글턴]안에 선언한다.


~~~ scala
object HelloWorld extends App {
  println("Hello, World!")
}
~~~

> 이렇게도 변형 가능함, 같은 결과가 출력된다.



### 컴파일 및 실행

**컴파일 :** `scalac filename.scala` 다음과 같은 명령어로 컴파일 할 수 있다.

**실행 :** `scala -classpath . HelloWorld` 다음과 같은 명령어로 실행하면 `Hello, world!` 라는 결과가 나온다.

#### +) scala 테스트 하려면 scala worksheet 파일 생성해서 해보는 것도 좋음!



### 'Hello, world!' with object keyword

~~~scala
object HelloWorld {
    def main(args: Array[String]){
        println("Hello, world!")
        objectCls.hello()
    }
}

object objectCls {
    def hello(){
        println("this object name is objectCls.")
    }
}
~~~



### InteliJ SBT프로젝트 directory 구조 

~~~markdown
- .idea (IntelliJ files)
- project (plugins and additional settings **for** sbt)
- src (source files)
    - main (application code)
        - java (Java source files)
        - scala (Scala source files) <-- This is all we need **for** now
        - scala-2.12 (Scala 2.12 specific files)
    - test (unit tests)
- target (generated files)
- build.sbt (build definition file **for** sbt)
~~~



### Writing Scala code

1. On the **Project** panel on the left, expand `SBTExampleProject` => `src` => `main`
2. Right-click `scala` and select **New** => **Package**
3. Name the package `example` and click **OK**.
4. Right-click the package `example` and select **New** => **Scala class**.
5. Name the class `Main` and change the **Kind** to `object`.
6. Change the code in the class to the following:

```
object Main extends App {
  val ages = Seq(42, 75, 29, 64)
  println(s"The oldest person is ${ages.max}")
}
```

Note: IntelliJ has its own implementation the Scala compiler, and sometimes your code is correct even though IntelliJ indicates otherwise. You can always check to see if sbt can run your project on the command line.



### Running the project

1. From the **Run** menu, select **Edit configurations**

2. Click the **+** button and select **SBT Task**.

3. Name it `Run the program`.

4. In the **Tasks** field, type `~run`. The `~` causes SBT to rebuild and rerun the project when you save changes to a file in the project.

5. Click **OK**.

6. On the **Run** menu. Click **Run ‘Run the program’**.

7. In the code, change `75` to `61` and look at the updated output in the console.

   ​

### Adding a dependency

Changing gears a bit, let’s look at how to use published libraries to add extra functionality to our apps.

1. Open up `build.sbt` and add the following line:

```
libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.0"
```

Here, `libraryDependencies` is a set of dependencies, and by using `+=`, we’re adding the [scala-parser-combinators](https://github.com/scala/scala-parser-combinators)dependency to the set of dependencies that sbt will go and fetch when it starts up. Now, in any Scala file, you can import classes, objects, etc, from scala-parser-combinators with a regular import.

You can find more published libraries on [Scaladex](https://index.scala-lang.org/), the Scala library index, where you can also copy the above dependency information for pasting into your `build.sbt` file.



## BUILDING A SCALA PROJECT WITH INTELLIJ AND SBT

In this tutorial, we’ll see how to build a Scala project using [sbt](http://www.scala-sbt.org/1.x/docs/index.html). sbt is a popular tool for compiling, running, and testing Scala projects of any size. Using a build tool such as sbt (or Maven/Gradle) becomes essential once you create projects with dependencies or more than one code file. We assume you’ve completed the [first tutorial](https://docs.scala-lang.org/getting-started-intellij-track/getting-started-with-scala-in-intellij.html).



### Creating the project

In this section, we’ll show you how to create the project in IntelliJ. However, if you’re comfortable with the command line, we recommend you try [Getting Started with Scala and sbt on the Command Line](https://docs.scala-lang.org/getting-started-sbt-track/getting-started-with-scala-and-sbt-on-the-command-line.html) and then come back here to the section “Writing Scala code”.

1. If you didn’t create the project from the command line, open up IntelliJ and select “Create New Project”
   - On the left panel, select Scala and on the right panel, select SBT
   - Click **Next**
   - Name the project “SBTExampleProject”
2. If you already created the project on the command line, open up IntelliJ, select *Import Project* and open the `build.sbt` file for your project
3. Make sure the **JDK Version** is 1.8 and the **SBT Version** is at least 0.13.13
4. Select **Use auto-import** so dependencies are automatically downloaded when available
5. Select **Finish**



### Understanding the directory structure

sbt creates many directories which can be useful once you start building more complex projects. You can ignore most of them for now but here’s a glance at what everything is for:

```
- .idea (IntelliJ files)
- project (plugins and additional settings for sbt)
- src (source files)
    - main (application code)
        - java (Java source files)
        - scala (Scala source files) <-- This is all we need for now
        - scala-2.12 (Scala 2.12 specific files)
    - test (unit tests)
- target (generated files)
- build.sbt (build definition file for sbt)
```



### Writing Scala code

1. On the **Project** panel on the left, expand `SBTExampleProject` => `src` => `main`
2. Right-click `scala` and select **New** => **Package**
3. Name the package `example` and click **OK**.
4. Right-click the package `example` and select **New** => **Scala class**.
5. Name the class `Main` and change the **Kind** to `object`.
6. Change the code in the class to the following:

```
object Main extends App {
  val ages = Seq(42, 75, 29, 64)
  println(s"The oldest person is ${ages.max}")
}
```

Note: IntelliJ has its own implementation the Scala compiler, and sometimes your code is correct even though IntelliJ indicates otherwise. You can always check to see if sbt can run your project on the command line.



### Running the project

1. From the **Run** menu, select **Edit configurations**
2. Click the **+** button and select **SBT Task**.
3. Name it `Run the program`.
4. In the **Tasks** field, type `~run`. The `~` causes SBT to rebuild and rerun the project when you save changes to a file in the project.
5. Click **OK**.
6. On the **Run** menu. Click **Run ‘Run the program’**.
7. In the code, change `75` to `61` and look at the updated output in the console.



### Adding a dependency

Changing gears a bit, let’s look at how to use published libraries to add extra functionality to our apps.

1. Open up `build.sbt` and add the following line:

```
libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.0"
```

Here, `libraryDependencies` is a set of dependencies, and by using `+=`, we’re adding the [scala-parser-combinators](https://github.com/scala/scala-parser-combinators)dependency to the set of dependencies that sbt will go and fetch when it starts up. Now, in any Scala file, you can import classes, objects, etc, from scala-parser-combinators with a regular import.

You can find more published libraries on [Scaladex](https://index.scala-lang.org/), the Scala library index, where you can also copy the above dependency information for pasting into your `build.sbt` file.



### Next steps

Continue to the next tutorial in the *getting started with IntelliJ* series, and learn about [testing Scala code in IntelliJ with ScalaTest](https://docs.scala-lang.org/getting-started-intellij-track/testing-scala-in-intellij-with-scalatest.html).

**or**

- Continue learning Scala interactively online on [Scala Exercises](https://www.scala-exercises.org/scala_tutorial).
- Learn about Scala’s features in bite-sized pieces by stepping through our [Tour of Scala](https://docs.scala-lang.org/tour/tour-of-scala.html).



***



[참고링크]

> https://docs.scala-lang.org/getting-started-intellij-track/getting-started-with-scala-in-intellij.html


[^싱글턴]: [클래스](https://docs.scala-lang.org/ko/tutorials/tour/classes.html)의 각 인스턴스와 연관되지 않은 메서드와 값들은 싱글톤 객체에 속하며, `class`대신에 `object`를 사용해 표시된다.