

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Administrar
      <small>Productos</small>
    </h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
      <li class="active">Productos</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <div class="col-md-12 col-xs-12">

        <div id="messages"></div>

        <?php if($this->session->flashdata('success')): ?>
          <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('success'); ?>
          </div>
        <?php elseif($this->session->flashdata('error')): ?>
          <div class="alert alert-error alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('error'); ?>
          </div>
        <?php endif; ?>


        <div class="box">
              <?php if($this->session->flashdata('successsku')): ?>
                  <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <?php echo $this->session->flashdata('successsku'); ?>
                  </div>
                <?php elseif($this->session->flashdata('errorsku')): ?>
                  <div class="alert alert-error alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <?php echo $this->session->flashdata('errorsku'); ?>
                  </div>
                <?php endif; ?>
                <?php $this->session->set_flashdata('errorsku', FALSE) ?>
                <?php $this->session->set_flashdata('successsku', FALSE) ?>
              <div class="box-header">
                <h3 class="box-title">Añadir Producto(s) ya existentes</h3>
              </div>
              <!-- /.box-header -->
              <form role="form" action="<?php echo base_url('products/updatebyid') ?>" method="post" enctype="multipart/form-data">
                  <div class="box-body">

                    <?php echo validation_errors(); ?>

                    <div class="form-group">
                      <label for="sku_create">SKU</label>
                      <input oninput="selectProductBySku()" type="text" class="form-control" id="skucreate" name="skucreate" placeholder="Ingresar SKU" autocomplete="off" required />
                    </div>

                    <div>
                      <label for="sku_create">Nombre del producto</label>
                      <select class="form-control select_group product" data-row-id="row_1" id="namecreate" name="namecreate" style="width:100%;" onchange="selectProductByName();" required>
                        <option value=" "></option>
                        <?php foreach ($products as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>

                    <div class="form-group">
                      <label for="qty_create">Cantidad</label>
                      <input value="1"  type="text" class="form-control" id="qtycreate" name="qtycreate" placeholder="Enter Qty" autocomplete="off"  required/>
                    </div>

                  </div>
                  <!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Añadir</button>
                  </div>
                </form>
              <!-- /.box-body -->
            </div>

        <div class="box">
          <div class="box-header">
            <h3 class="box-title">Añadir Producto Nuevo</h3>
          </div>
          <!-- /.box-header -->
          <form role="form" action="<?php base_url('products/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                <div class="form-group hidden">

                  <label for="product_image">Image</label>
                  <div class="kv-avatar">
                      <div class="file-loading">
                          <input id="product_image" name="product_image" type="file">
                      </div>
                  </div>
                </div>

                <div class="form-group">
                  <label for="product_name">Nombre del Producto</label>
                  <input type="text" class="form-control" id="product_name" name="product_name" placeholder="Enter product name" autocomplete="off"/>
                </div>

                <div class="form-group">
                  <label for="sku">SKU</label>
                  <input type="text" class="form-control" id="sku" name="sku" placeholder="Enter sku" autocomplete="off" />
                </div>

                <div class="form-group">
                  <label for="price">Precio</label>
                  <input type="text" class="form-control" id="price" name="price" placeholder="Enter price" autocomplete="off" />
                </div>

                <div class="form-group">
                  <label for="qty">Cantidad</label>
                  <input type="text" class="form-control" id="qty" name="qty" placeholder="Enter Qty" autocomplete="off" />
                </div>

                <div class="form-group">
                  <label for="description">Descripción</label>
                  <textarea type="text" class="form-control" id="description" name="description" placeholder="Enter 
                  description" autocomplete="off">
                  </textarea>
                </div>

                <?php if($attributes): ?>
                  <?php foreach ($attributes as $k => $v): ?>
                    <div class="form-group">
                      <label for="groups"><?php echo $v['attribute_data']['name'] ?></label>
                      <select class="form-control select_group" id="attributes_value_id" name="attributes_value_id[]" multiple="multiple">
                        <?php foreach ($v['attribute_value'] as $k2 => $v2): ?>
                          <option value="<?php echo $v2['id'] ?>"><?php echo $v2['value'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>    
                  <?php endforeach ?>
                <?php endif; ?>

                <div class="form-group hidden">
                  <label for="brands">Marcas</label>
                  <select class="form-control select_group" id="brands" name="brands[]" multiple="multiple">
                    <?php foreach ($brands as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>

                <div class="form-group">
                  <label for="category">Categorías</label>
                  <select class="form-control select_group" id="category" name="category[]" multiple="multiple">
                    <?php foreach ($category as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>

                <div class="form-group">
                  <label for="store">Tienda</label>
                  <select class="form-control select_group" id="store" name="store">
                    <?php foreach ($stores as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>

                <div class="form-group">
                  <label for="store">Disponibilidad</label>
                  <select class="form-control" id="availability" name="availability">
                    <option value="1">Si</option>
                    <option value="2">No</option>
                  </select>
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Añadir Producto</button>
                <a href="<?php echo base_url('products/') ?>" class="btn btn-warning">Atras</a>
              </div>
            </form>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- col-md-12 -->
    </div>
    <!-- /.row -->
    

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<script type="text/javascript">
  
  var base_url = "<?php echo base_url(); ?>";

  $(document).ready(function() {
    $(".select_group").select2();
    $("#description").wysihtml5();

    $("#mainProductNav").addClass('active');
    $("#addProductNav").addClass('active');
    
    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' + 
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="glyphicon glyphicon-tag"></i>' +
        '</button>'; 
    $("#product_image").fileinput({
        overwriteInitial: true,
        maxFileSize: 1500,
        showClose: false,
        showCaption: false,
        browseLabel: '',
        removeLabel: '',
        browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
        removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
        removeTitle: 'Cancel or reset changes',
        elErrorContainer: '#kv-avatar-errors-1',
        msgErrorClass: 'alert alert-block alert-danger',
        // defaultPreviewContent: '<img src="/uploads/default_avatar_male.jpg" alt="Your Avatar">',
        layoutTemplates: {main2: '{preview} ' +  btnCust + ' {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });

  });

  function selectProductBySku(){
      if ($("#skucreate").val()!=""){
          $.ajax({
            url: base_url + 'dashboard/getbysku',
            type: 'post',
            data:{skucreate:$("#skucreate").val()},
            dataType: 'json',
            success: function(data) {
                if (data!=null) { 
                $("#namecreate").val(data.id).change();
                //if (typeof table != "undefined"){
                  //namedelete.value = table[1];
                //} else {
                  //namedelete.value = "";
                //}
                } else {
                  $("#namecreate").val([]).change();
                }
            },
            error: function(thrownError) {
                alert(JSON.stringify(thrownError));
            }
            
        });
      } else {
        $("#namecreate").val([]).change();
      }
    }

    function selectProductByName(){
      var product_id = $("#namecreate").val();    
      if(product_id == "") {
        $("#skucreate").val("");
      } else {
        $.ajax({
          url: base_url + 'orders/getProductValueById',
          type: 'post',
          data: {product_id : product_id},
          dataType: 'json',
          success:function(response) {
            // setting the rate value into the rate input field
            $("#skucreate").val(response.sku);
          } // /success
        }); // /ajax function to fetch the product data 
      }
    }
</script>