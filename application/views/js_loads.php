<?php /* for grocery crud */ 

foreach($js_files as $file): ?>
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

<!-- jQuery Version 1.11.0 -->
<script src="<?=$this->config->item('base_url')?>static/js/jquery-1.11.0.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="<?=$this->config->item('base_url')?>static/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<?=$this->config->item('base_url')?>static/js/plugins/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript 
<script src="<?=$this->config->item('base_url')?>static/js/plugins/morris/raphael.min.js"></script>
<script src="<?=$this->config->item('base_url')?>static/js/plugins/morris/morris.min.js"></script>
-->

<!-- Custom Theme JavaScript -->
<script src="<?=$this->config->item('base_url')?>static/js/sb-admin-2.js"></script>
