<!DOCKTYPE html>
   
<head>
    <meta charset="utf-8">
        <title>dfgdfff</title>
</head>
<body>
    <?php
        print_r($_POST);
        $count=0;
        if(isset ($_POST["c"])){
            $count=$POST["c"];
            $count++;
        }
    else {
        $count=0;
    }
    ?>
</body>
    
    <form method="POST">
        <input name="imie">
        <input name="nazwisko">
        <input type="submit">
        <input type="hidden" name="c"value="<?php echo $count; ?>">
    </form>
   

