<?php
include('database.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>


    </style>
</head>
<body>
    <h1>Register at practice book...</h1>
    <form action="<?php $_SERVER["PHP_SELF"] ?>" method="post">
        <label>Username:</label>
        <input type="text" name="username"><br>
        <label>Password:</label>
        <input type="password" name="password"><br>
        <input type="submit" value="Register" name="register">
    </form>
</body>
</html>
<?php
if($_SERVER["REQUEST_METHOD"]=="POST"){
    $username = filter_input(INPUT_POST,"username",FILTER_SANITIZE_SPECIAL_CHARS) ;
    $password = filter_input(INPUT_POST,"password",FILTER_SANITIZE_SPECIAL_CHARS) ;

    $hash ="";

    if(!empty($username)&&!empty($password)){
        $hash=password_hash($password,PASSWORD_DEFAULT);
        $sql = "INSERT INTO users(user,pass) VALUES ('$username','$hash')" ;
        try{
            mysqli_query($conn, $sql);
            echo"{$username} has been successfully Registered....<br> ";
        }catch(mysqli_sql_exception){
            echo "Error: Username already Exists...";
        }
    }else{

    }echo "Enter username/password...";
    






}





mysqli_close($conn);
?>
