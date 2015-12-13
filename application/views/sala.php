<h4>Gobierno: <?=$licitacion->gobierno ?></h4>
<p>
A continuación la lista dedocumentos entregados por las empresas participantes
</p>
<?= $lista_documentos ?>

<h2>Conversaciones abiertas</h2>

<? foreach ($chats as $chat) {	?>

<div class="col-lg-5">
<div class="chat-panel panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-comments fa-fw" title="<?= $chat->descripcion_chat ?>"></i>
        <?= $chat->titulo_chat ?>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <ul class="chat">

	<? foreach ($chat->chats as $msg) {	?>
	<li class="left clearfix">
        <span class="chat-img pull-left">
            <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle">
        </span>
        <div class="chat-body clearfix">
            <div class="header">
                <strong class="primary-font"><?= $msg->usuario . ' ('.$msg->perfil_tipo .' - ' . $msg->perfil_nombre .')' ?></strong>
                <small class="pull-right text-muted">
                    <i class="fa fa-clock-o fa-fw"></i> <?=$msg->momento?>
                </small>
            </div>
            <p><?=$msg->mensaje?>
            </p>
        </div>
    </li>


	<? } ?>

	</ul>
    </div>
    <!-- /.panel-body -->
    <div class="panel-footer">
        <div class="input-group">
            <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here...">
            <span class="input-group-btn">
                <button class="btn btn-warning btn-sm" id="btn-chat">
                    Send
                </button>
            </span>
        </div>
    </div>
    <!-- /.panel-footer -->
</div>
</div>
<? } ?>