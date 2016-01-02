<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?=$my_base_url?>"><?=$title?> :: <?=$this->user_model->nice_name()?> </a>
            </div>
            
            <? /*=$notifications_bar */ ?>
            <?=$notifications_bar?>

            <?= $menu_principal ?>
            
        </nav>