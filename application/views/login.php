<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?=$title?></title>

    <!-- Bootstrap Core CSS -->
    <link href="<?=$this->config->item('base_url')?>static/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<?=$this->config->item('base_url')?>static/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<?=$this->config->item('base_url')?>static/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?=$this->config->item('base_url')?>static/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title">Ingresar al sistema</h3></div>
        <? if (isset($error)){ ?>
            <div class="panel-heading"><h4 class="panel-title"><?=$error?></h4></div>
        <? } ?>
                    <div class="panel-body">
                        <form role="form" action='<?=$my_base_url?>home/login' method='POST'>
<fieldset>
    <div class="form-group">
        <input class="form-control" placeholder="Usuario" name="user" type="text" autofocus>
    </div>
    <div class="form-group">
        <input class="form-control" placeholder="Clave" name="password" type="password" value="">
    </div>
<!--<div class="checkbox">
<label><input name="remember" type="checkbox" value="Remember Me">Remember Me</label>
</div> -->
    <!-- Change this to a button or input when using this as a form -->
    <button class="btn btn-lg btn-success btn-block" type='submit'>Ingresar</button>
</fieldset>
                        </form>
                    </div>

<img src='<?=$this->config->item('base_url')?>static/img/Logo_ICDA_b.jpg' style='max-height:50px; padding:10px;'/>
<!-- <img src='<?=$this->config->item('base_url')?>static/img/logo-junar-cuad.jpg' style='max-height:50px; padding:10px;'/> -->
<img src='<?=$this->config->item('base_url')?>static/img/logo-hardvard-2.jpg' style='max-height:50px; padding:10px;' />

                </div>
            </div>
        </div>
    </div>

    <!-- jQuery Version 1.11.0 -->
    <script src="<?=$this->config->item('base_url')?>static/js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?=$this->config->item('base_url')?>static/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<?=$this->config->item('base_url')?>static/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<?=$this->config->item('base_url')?>static/js/sb-admin-2.js"></script>

</body>

</html>
