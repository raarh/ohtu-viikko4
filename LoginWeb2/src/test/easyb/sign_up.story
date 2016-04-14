import ohtu.*
import ohtu.authentication.*
import org.openqa.selenium.*
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

description 'User can create account'

scenario "user can create account with correct password and username", {
    given 'register new user selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();

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

    then 'user redirected to newUser page', {

        driver.getPageSource().contains("Welcome to Ohtu App!").shouldBe true

    }
    when 'user goes to application mainpage',{
        element = driver.findElement(By.linkText("continue to application mainpage"));
        element.click();
    }
    and 'logs out',{
        element = driver.findElement(By.linkText("logout"));
        element.click();
    }
    then 'yoloo',{
        driver.getPageSource().contains("Ohtu App").shouldBe true
        driver.getPageSource().contains("login").shouldBe true
        driver.getPageSource().contains("register new user").shouldBe true
    }
}

scenario "user can not create account with incorrect password", {
    given 'register new user selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }
    when 'a valid username and incorrect password are given', {
        password = "mattijuhani"
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcfeg");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }
    then 'user will face an error', {
        driver.getPageSource().contains("must contain one character that is not a letter").shouldBe true
    }
    when 'a valid username and too short password are given', {
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
    then 'user will face a error message', {
        driver.getPageSource().contains("length greater or equal to 8").shouldBe true
    }
}
    scenario "user can not create account with too short username", {
        given 'register new user selected', {
            driver = new HtmlUnitDriver();
            driver.get("http://localhost:8090");
            element = driver.findElement(By.linkText("register new user"));
            element.click();
        }
        when 'a valid username and incorrect password are given',{
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
        then 'user will face an error',{

            driver.getPageSource().contains("length 5-10").shouldBe true
        }
    }
scenario "user can not create account with too long username", {
    given 'register new user selected', {
        driver = new HtmlUnitDriver();
        driver.get("http://localhost:8090");
        element = driver.findElement(By.linkText("register new user"));
        element.click();
    }
    when 'a valid username and incorrect password are given',{
        password = "matti1juhani"
        element = driver.findElement(By.name("username"));
        element.sendKeys("abcdefghijk");
        element = driver.findElement(By.name("password"));
        element.sendKeys(password);
        element = driver.findElement(By.name("passwordConfirmation"))
        element.sendKeys(password);
        element = driver.findElement(By.name("add"));
        element.submit();
    }
    then 'user will face an error',{

        driver.getPageSource().contains("length 5-10").shouldBe true
    }
}
