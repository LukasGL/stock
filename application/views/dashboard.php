

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Inicio
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div id="messages"></div>

        

      <?php if($is_admin == true): ?>

        <div class="row">
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
              <div class="inner">
                <h3><?php echo $total_products ?></h3>

                <p>Total de Productos</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="<?php echo base_url('products/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
              <div class="inner">
                <h3><?php echo $total_paid_orders ?></h3>

                <p>Total de Ordenes Pagadas</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="<?php echo base_url('orders/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-yellow">
              <div class="inner">
                <h3><?php echo $total_users; ?></h3>

                <p>Total de Usuarios</p>
              </div>
              <div class="icon">
                <i class="ion ion-android-people"></i>
              </div>
              <a href="<?php echo base_url('users/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
              <div class="inner">
                <h3><?php echo $total_stores ?></h3>

                <p>Total de Tiendas</p>
              </div>
              <div class="icon">
                <i class="ion ion-android-home"></i>
              </div>
              <a href="<?php echo base_url('stores/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
      <?php endif; ?>
          
<!--     Remover productos multiples                       -->
          <div class="box">
            <?php if($this->session->flashdata('successsku2')): ?>
              <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <?php echo $this->session->flashdata('successsku2'); ?>
              </div>
            <?php elseif($this->session->flashdata('errorsku2')): ?>
              <div class="alert alert-error alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <?php echo $this->session->flashdata('errorsku2'); ?>
              </div>
            <?php endif; ?>
            <?php $this->session->set_flashdata('errorsku2', FALSE) ?>
            <?php $this->session->set_flashdata('successsku2', FALSE) ?>
            <div class="box-header">
              <h3 class="box-title">Quitar Productos de Inventario</h3>
            </div>
            <!-- /.box-header -->
            <form id="formdash" role="form" action="<?php echo base_url('dashboard/multsubstract') ?>" method="post" class="form-horizontal">
                <div class="box-body">

                  
                  <table class="table table-bordered" id="product_info_table">
                    <thead>
                      <tr>
                        <th style="width:30%">SKU</th>
                        <th style="width:40%">Producto</th>
                        <th style="width:10%">Cantidad disponible</th>
                        <th style="width:10%">Cantidad</th>
                        <th style="width:20%">Precio unidad</th>
                        <th style="width:10%">Eliminar</th>
                      </tr>
                    </thead>

                    <tbody>
                      <tr id="row_1">
                        <td>
                        <input type="text" class="form-control" id="skudelete_1" oninput="selectProductBySku('1')" name="skudelete[]" placeholder="Enter sku" autocomplete="off" />
                    
                          </td>
                          <td><select class="form-control select_group product" data-row-id="row_1" id="namedelete_1" name="namedelete[]" style="width:100%;" onchange="selectProductByName('1');">
                            <option value=""></option>
                            <?php foreach ($products as $k => $v): ?>
                              <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                            <?php endforeach ?>
                          </select></td>
                        
                          <td>
                            <input type="text"  name="qtydispdelete[]" id="qtydispdelete_1" class="form-control" autocomplete="off" disabled>
                          </td>
                          <td>
                            <input type="text" value="1" name="qtydelete[]" id="qtydelete_1" class="form-control" autocomplete="off">
                          </td>
                          <td>
                            <input type="text" name="amountdelete[]" id="amountdelete_1" class="form-control" disabled autocomplete="off">
                          </td>
                          <td><button type="button" class="btn btn-default" onclick="removeRow('1')"><i class="fa fa-close"></i></button></td>
                      </tr>
                    </tbody>
                  </table>

                  <br /> <br/>

                  <div class="col-md-6 col-xs-12 pull pull-right">


                  </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                </div>
              
              </form>
            <!-- /.box-body -->
          </div>
          <div class="box" style="margin-top: 15px;">
          <div class="box-header">
            <h3 class="box-title">Productos Favoritos</h3>
          </div>
          <!-- /.box-header -->
          <div class="box-body">
            <table width="100%" id="manageTable" class="table table-bordered table-striped">
              <thead>
              <tr>
                <th>SKU</th>
                <th>Nombre del Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Tienda</th>
                <th>Disponibilidad</th>
                <?php if(in_array('updateProduct', $user_permission) || in_array('deleteProduct', $user_permission)): ?>
                  <th>Acción</th>
                <?php endif; ?>
              </tr>
              </thead>

            </table>
          </div>
<!--   END  Remover productos multiples                       -->
            

       

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <?php if(in_array('deleteProduct', $user_permission)): ?>
<!-- remove brand modal -->
<div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Eliminar Producto</h4>
      </div>

      <form role="form" action="<?php echo base_url('products/remove') ?>" method="post" id="removeForm">
        <div class="modal-body">
          <p>¿Quieres eliminar definitavemnte este producto? (No se podrá recuperar)</p>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Si</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        </div>
      </form>


    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>

  <script type="text/javascript">
    var skucreate = document.getElementById("skucreate");
    var namecreate = document.getElementById("namecreate");
    var skudelete = document.getElementById("skudelete");
    var namedelete = document.getElementById("namedelete");
    var base_url = "<?php echo base_url(); ?>";

    $(document).ready(function() {
      $("#dashboardMainMenu").addClass('active');
      $(".product").select2();

      $("#mainProductNav").addClass('active');
      // initialize the datatable 
      manageTable = $('#manageTable').DataTable({
        'ajax': {
          "url": base_url + 'products/fetchProductDataByCategory',
          "data": function (d) {
            d.category_id = "5";
          }},
        'order': [],
        'columns': [
          { 'type': 'html'},
          { 'type': 'html'},
          { 'type': 'html'},
          { 'type': 'num'},
          { 'type': 'html'},
          { 'type': 'html'},
          { 'type': 'html'},
        ],
        "scrollX": true,
      });
	
      
    }); 

	$('#formdash').on('keyup keypress', function(e) {
  var keyCode = e.keyCode || e.which;
  if (keyCode === 13) { 
    e.preventDefault();
    return false;
  }
});
    
    $(skucreate).on('input',function(e){
      if ($(skucreate).val()!=""){
      $.ajax({
        url: "<?php echo base_url('dashboard/getbysku') ?>",
        type: 'POST',
        data:{skucreate:$(skucreate).val()},
        dataType: 'text',
        cache: false,
        success: function(data) {
            var table = (JSON.parse(data).data)[0];
            if (typeof table != "undefined"){
              namecreate.value = table[1];
            } else {
              namecreate.value = "";
            }
        },
        error: function(thrownError) {
            alert(JSON.stringify(thrownError));
        }
        
    });
      }
    });

    function selectProductBySku(row_id){
      if ($("#skudelete_"+row_id).val()!=""){
          $.ajax({
            url: base_url + 'dashboard/getbysku',
            type: 'post',
            data:{skucreate:$("#skudelete_"+row_id).val()},
            dataType: 'json',
            success: function(data) {
                if (data!=null) { 
                $("#amountdelete_"+row_id).val(data.price);
                $("#qtydispdelete_"+row_id).val(data.qty);
                $("#namedelete_"+row_id).val(data.id).change();
                $("#namedelete_"+row_id).prop( "required", true );
                //if (typeof table != "undefined"){
                  //namedelete.value = table[1];
                //} else {
                  //namedelete.value = "";
                //}
                }
            },
            error: function(thrownError) {
                alert(JSON.stringify(thrownError));
            }
            
        });
      }
    }

    function selectProductByName(row_id){
      var product_id = $("#namedelete_"+row_id).val();    
      if(product_id == "") {
        $("#skudelete_"+row_id).val("");
        $("#qtydelete_"+row_id).val("");       
        $("#amountdelete_"+row_id).val("");
      } else {
        $.ajax({
          url: base_url + 'orders/getProductValueById',
          type: 'post',
          data: {product_id : product_id},
          dataType: 'json',
          success:function(response) {
            // setting the rate value into the rate input field
            $("#skudelete_"+row_id).val(response.sku);  
            $("#skudelete_"+row_id).prop( "disabled", true );
            $("#amountdelete_"+row_id).val(response.price);
            $("#qtydispdelete_"+row_id).val(response.qty);
            $("#namedelete_"+row_id).prop( "required", true );
            newRow();
          } // /success
        }); // /ajax function to fetch the product data 
      }
    }

    function newRow(){
      var table = $("#product_info_table");
      var count_table_tbody_tr = $("#product_info_table tbody tr:last")[0].id.slice(4,$("#product_info_table tbody tr:last")[0].id.length);
      var row_id = parseInt(count_table_tbody_tr) + 1;

      $.ajax({
            url: base_url + '/dashboard/getTableProductRow/',
            type: 'post',
            dataType: 'text',
            success:function(response) {
              
                var html = '<tr id="row_'+row_id+'">' +
                        '<td>' +
                        '<input type="text" class="form-control" id="skudelete_'+row_id+'" oninput="selectProductBySku(\''+row_id+'\')" name="skudelete[]" placeholder="Enter sku" autocomplete="off" />' +
                          '</td>' +
                          '<td><select class="form-control select_group product" data-row-id="row_'+row_id+'" id="namedelete_'+row_id+'" name="namedelete[]" style="width:100%;" onchange="selectProductByName(\''+row_id+'\');">' +
                            '<option value=""></option>';
                $.each(JSON.parse(response), function(index, value) {
                  html += '<option value="'+value.id+'">'+value.name+'</option>';
                });

                html += '</select></td>' +
                          '<td>' +
                            '<input type="text" name="qtydispdelete[]" id="qtydispdelete_'+row_id+'" class="form-control" autocomplete="off" disabled>' +
                          '</td>' +
                          '<td>' +
                            '<input type="text" value="1" name="qtydelete[]" id="qtydelete_'+row_id+'" class="form-control" autocomplete="off">' +
                          '</td>' +
                          '<td>' +
                            '<input type="text" name="amountdelete[]" id="amountdelete_'+row_id+'" class="form-control" disabled autocomplete="off">' +
                          '</td>' +
                          '<td><button type="button" class="btn btn-default" onclick="removeRow(\''+row_id+'\')"><i class="fa fa-close"></i></button></td>' +
                      '</tr>';
                  
                  if(count_table_tbody_tr >= 1) {
                  $("#product_info_table tbody tr:last").after(html);  
                }
                else {
                  $("#product_info_table tbody").html(html);
                }

                $(".product").select2();
                $("#skudelete_"+row_id).select();
              

            }
          });

    }

    function removeRow(tr_id)
  {
    
    $("#product_info_table tbody tr#row_"+tr_id).remove();
  }
    
  </script>
