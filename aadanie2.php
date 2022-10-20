<!DOCKTYPE html>
   
<head>
    <meta charset="utf-8">
        <title>dfgdfff</title>
</head>
<body>
    <?php
  
        print_r($_COOKIE);
        $count;
        if(isset($_COOKIE["c"])){
        $count=$COOKIE["c"];
        $count++;
    }
    else{
       $count=0;
   }
    setcookie("c". $count);

    ?>
     <form method="POST">
        <input name="imie">
        <input name="nazwisko">
        <input type="submit">
        <input type="hidden" name="c"value="<?php echo $count; ?>">
    </form>
   
   
</body>
    