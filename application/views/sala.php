<h4>Gobierno: <?=$licitacion->gobierno ?></h4>
<p>
A continuación la lista dedocumentos entregados por las empresas participantes
</p>
<?= $lista_documentos ?>

<h2>Conversaciones abiertas</h2>

<? foreach ($chats as $chat) {	?>
	<h4><?= $chat->titulo_chat ?></h4>
	<p><?= $chat->descripcion_chat ?></p>

	<? foreach ($chat->chats as $msg) {	?>
	<p>
		<b><?= $msg->usuario ?></b>
		<?= '('.$msg->perfil_tipo .' - ' . $msg->perfil_nombre .') el '.$msg->momento.': <br/>' . $msg->mensaje ?>

	</p>
	<? } ?>
<? } ?>

