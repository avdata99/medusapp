<?= $headers ?>
<body>
    <div id="wrapper">

        <?= $navbar ?>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><?= $title_table ?></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

<? if (isset($table_pre)) { ?> <div class="row"><?= $table_pre ?></div> <? } ?>

<div class="row"><?= $table ?></div>
            
<? if (isset($table_pos)) { ?> <div class="row"><?= $table_pos ?></div> <? } ?>

<? if (ENVIRONMENT=='development' && isset($debug)) { ?> <div class="row"><?= $debug ?></div> <? } ?>
        </div>
        <!-- /#page-wrapper -->

    </div>

    <span style='display:none' id='CSRF'><?=$GUID?></span>


<?= $js_loads ?>

<? if (isset($local_js)) { echo $local_js; } ?>


</body>

</html>
