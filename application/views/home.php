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

        </div>
        <!-- /#page-wrapper -->

    </div>
    
    <?= $js_loads ?>

</body>

</html>
