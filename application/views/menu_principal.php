

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            
            <li><a <? if ($active=='inicio'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home"><i class="fa fa-home fa-fw"></i> Inicio</a></li>
        <? if ($this->user_model->can('VIEW_GOVS')) { ?>
            <li><a <? if ($active=='gobiernos'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/gobiernos"><i class="fa fa-map-marker fa-fw"></i> Gobiernos</a></li>
        <? } ?>
        <? if ($this->user_model->can('VIEW_LICITACION')) { ?>
            <li><a <? if ($active=='licitaciones'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/licitaciones"><i class="fa fa-paperclip fa-fw"></i> Licitaciones</a></li>
        <? } ?>
        <? if ($this->user_model->can('VIEW_OBSERVADORES')) { ?>
            <li><a <? if ($active=='observadores'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/observadores"><i class="fa fa-user fa-fw"></i> Observadores</a></li>
        <? } ?>
        <? if ($this->user_model->can('VIEW_EMPRESAS')) { ?>
            <li><a <? if ($active=='empresas'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/empresas"><i class="fa fa-shopping-cart fa-fw"></i> Empresas</a></li>
        <? } ?>
        <? if ($this->user_model->can('VIEW_CIUDADANOS')) { ?>
            <li><a <? if ($active=='ciudadanos'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/ciudadanos"><i class="fa fa-users fa-fw"></i> Ciudadanos</a></li>
        <? } ?>
        <? if ($this->user_model->can('VIEW_USUARIOS')) { ?>
            <li><a <? if ($active=='usuarios'){ ?>class="active"<? } ?> href="<?=$my_base_url?>home/usuarios"><i class="fa fa-sign-in fa-fw"></i> Usuarios</a></li>
        <? } ?>
            
            <li>
                <a href="#"><i class="fa fa-sitemap fa-fw"></i> A cerca de ..<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a <? if ($active=='inicio'){ ?>class="quienes"<? } ?>href="#">Quienes somos</a></li>
                    <li><a <? if ($active=='inicio'){ ?>class="about"<? } ?>href="#">Sobre <?=$this->config->item('app_name_short')?></a></li>
                </ul>
                <!-- /.nav-second-level -->
            </li>

            <li><a title='Usuario <?=$session['user_name']?>' href="<?=$my_base_url?>home/logout"><i class="fa fa-sign-out fa-fw"></i> Salir</a></li>
            
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>