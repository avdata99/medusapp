<h4>Gobierno: <?=$licitacion->gobierno ?></h4>
<p>
A continuación la lista dedocumentos entregados por las empresas participantes
</p>
<?= $lista_documentos ?>

<h2>Conversaciones abiertas</h2>

<? foreach ($chats as $sala_id => $chat) {	?>

<div class="col-lg-5">
<div class="chat-panel panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-comments fa-fw" title="<?= $chat->descripcion_chat ?>"></i>
        <?= $chat->titulo_chat ?>
    </div>
    <!-- /.panel-heading -->
    <div class="panel-body">
        <ul class="chat" id="lista_mensajes_<?=$sala_id?>">

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
            <input id="input_mensaje_<?=$sala_id?>" type="text" 
            	class="form-control input-sm" 
            	placeholder="Escribe tu mensaje aquí...">

            <span class="input-group-btn">
                <button class="btn btn-warning btn-sm btn_enviar_chat" 
                    data-sala='<?=$sala_id?>'
                    data-perfiltipo='<?=$perfil_tipo?>'
                    data-perfilnombre='<?=$perfil_nombre?>'>
                    Enviar
                </button>
            </span>
        </div>
    </div>
    <!-- /.panel-footer -->
</div>
</div>
<? } ?>


<!-- elemento dela lista generico. template -->
<div style='display:none'>
<ul>
<li class="left clearfix" id='generic_chat_message_element'>
    <span class="chat-img pull-left">
        <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle">
    </span>
    <div class="chat-body clearfix">
        <div class="header">
            <strong class="primary-font" id='user_txt'></strong>
            <small class="pull-right text-muted" id='time_txt'>
                <i class="fa fa-clock-o fa-fw"></i> 
            </small>
        </div>
        <p id='msg_txt'></p>
    </div>
</li>
</ul>
</div>