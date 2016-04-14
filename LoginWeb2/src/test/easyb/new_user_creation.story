import ohtu.*
import ohtu.services.*
import ohtu.data_access.*
import ohtu.domain.*
import ohtu.io.*
import org.openqa.selenium.*
import org.openqa.selenium.htmlunit.HtmlUnitDriver;


description """A new user account can be created
              if a proper unused username
              and a proper password are given"""

scenario "creation succesfull with correct username and password", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a valid username and password are entered', {

    }
        when 'a valid username and password are given', {
            password = "matti1juhani"
            element = driver.findElement(By.name("username"));
            element.sendKeys("abcdef");
            element = driver.findElement(By.name("password"));
            element.sendKeys(password);
            element = driver.findElement(By.name("passwordConfirmation"))
            element.sendKeys(password);
            element = driver.findElement(By.name("add"));
            element.submit();
    }

    then 'new user is registered to system', {
        driver.getPageSource().contains("Welcome to Ohtu App!").shouldBe true
    }
}

scenario "can login with succesfully generated account", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a valid username and password are entered', {
        password = "matti1juhani"
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcdefg");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }

    then  'new credentials allow logging in to system', {
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("login"));
        element.click();
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcdefg");
        element = driver.findElement(By.name("password"));
        element.sendKeys("matti1juhani");
        element = driver.findElement(By.name("login"));
        element.submit();
        driver.getPageSource().contains("Welcome to Ohtu Application!").shouldBe true
    }
}

scenario "creation fails with correct username and too short password", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a valid username and too short password are entered',{
        password = "1abcd"
        element = driver.findElement(By.name("username"));
        element.sendKeys("mkdira");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }
    then 'new user is not be registered to system',{
        driver.getPageSource().contains("length greater or equal to 8").shouldBe true
    }
}

scenario "creation fails with correct username and pasword consisting of letters", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }
    when 'a valid username and password consisting of letters are entered',{
        password = "asdasdasd"
        element = driver.findElement(By.name("username"));
        element.sendKeys("mooomooo");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();

    }
    then 'new user is not be registered to system',{
        driver.getPageSource().contains("must contain one character that is not a letter").shouldBe true
    }
}

scenario "creation fails with too short username and valid pasword", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a too sort username and valid password are entered', {
        password = "matti1juhani"
        element = driver.findElement(By.name("username"));
        element.sendKeys("abc");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new user is not be registered to system',{
        driver.getPageSource().contains("length 5-10").shouldBe true
    }
}

scenario "creation fails with already taken username and valid pasword", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a already taken username and valid password are entered', {
    password = "matti1juhani"
    element = driver.findElement(By.name("username"));
    element.sendKeys("abcdefg");
    element = driver.findElement(By.name("password"));
    element.sendKeys(password);
    element = driver.findElement(By.name("passwordConfirmation"))
    element.sendKeys(password);
    element = driver.findElement(By.name("add"));
    element.submit();

    driver.get("http://localhost:8090");
    element = driver.findElement(By.linkText("register new user"));
    element.click();
    element = driver.findElement(By.name("username"));
    element.sendKeys("abcdefg");
    element = driver.findElement(By.name("password"));
    element.sendKeys(password);
    element = driver.findElement(By.name("passwordConfirmation"))
    element.sendKeys(password);
    element = driver.findElement(By.name("add"));
    element.submit();
    }
    then 'new user is not be registered to system', {
        driver.getPageSource().contains("username or password invalid").shouldBe true
    }
}

scenario "can not login with account that is not succesfully created", {
    given 'command new user is selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }

    when 'a invalid username/password are entered',{
        password = "mattijuhani"
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcdefg");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }

    then 'new credentials do not allow logging in to system',{
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("login"));
        element.click();
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcdefg");
        element = driver.findElement(By.name("password"));
        element.sendKeys("mattijuhani");
        element = driver.findElement(By.name("login"));
        element.submit();
        driver.getPageSource().contains("wrong username or password").shouldBe true
    }
}