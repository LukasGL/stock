

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
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

                <p>Total Products</p>
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

                <p>Total Paid Orders</p>
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

                <p>Total Users</p>
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

                <p>Total Stores</p>
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
              <form role="form" action="<?php echo base_url('dashboard/updatebysku') ?>" method="post" enctype="multipart/form-data">
                  <div class="box-body">

                    <?php echo validation_errors(); ?>

                    <div class="form-group">
                      <label for="sku_create">SKU</label>
                      <input type="text" class="form-control" id="skucreate" name="skucreate" placeholder="Enter sku" autocomplete="off" />
                    </div>

                    <div>
                      <label for="sku_create">Nombre del producto</label>
                      <input type="text" class="form-control" id="namecreate" name="namecreate" placeholder="Enter sku" autocomplete="off" disabled />
                    </div>

                    <div class="form-group">
                      <label for="qty_create">Qty</label>
                      <input  type="text" class="form-control" id="qtycreate" name="qtycreate" placeholder="Enter Qty" autocomplete="off" />
                    </div>

                  </div>
                  <!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                  </div>
                </form>
              <!-- /.box-body -->
            </div>
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
              <h3 class="box-title">Add Order</h3>
            </div>
            <!-- /.box-header -->
            <form role="form" action="<?php base_url('dashboard/substractmultiplebysku') ?>" method="post" class="form-horizontal">
                <div class="box-body">

                  <div class="form-group">
                    <label for="gross_amount" class="col-sm-12 control-label">Date: <?php echo date('Y-m-d') ?></label>
                  </div>
                  <div class="form-group">
                    <label for="gross_amount" class="col-sm-12 control-label">Date: <?php echo date('h:i a') ?></label>
                  </div>

                  <br /> <br/>
                  <table class="table table-bordered" id="product_info_table">
                    <thead>
                      <tr>
                        <th style="width:40%">SKU</th>
                        <th style="width:40%">Producto</th>
                        <th style="width:10%">Cantidad</th>
                        <th style="width:20%">Precio unidad</th>
                        <th style="width:10%">Eliminar</th>
                      </tr>
                    </thead>

                    <tbody>
                      <tr id="row_1">
                        <td>
                        <input type="text" class="form-control" id="skudelete" name="skudelete" placeholder="Enter sku" autocomplete="off" />
                          </td>
                          <td><select class="form-control select_group product" data-row-id="row_1" id="product_1" name="product[]" style="width:100%;" onchange="getProductData(1)" required>
                            <option value=""></option>
                            <?php foreach ($products as $k => $v): ?>
                              <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                            <?php endforeach ?>
                          </select></td>
                          <td>
                            <input type="text" value="1" name="qtydelete" id="qtydelete" class="form-control" autocomplete="off">
                          </td>
                          <td>
                            <input type="text" name="amountdelete" id="amountdelete" class="form-control" disabled autocomplete="off">
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

              
              </form>
            <!-- /.box-body -->
          </div>
<!--   END  Remover productos multiples                       -->
            

       

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script type="text/javascript">
    var skucreate = document.getElementById("skucreate");
    var namecreate = document.getElementById("namecreate");
    var skudelete = document.getElementById("skudelete");
    var namedelete = document.getElementById("namedelete");
    var base_url = "<?php echo base_url(); ?>";

    $(document).ready(function() {
      $("#dashboardMainMenu").addClass('active');

      $("#add_row").unbind('click').bind('click', function() {
      var table = $("#product_info_table");
      var count_table_tbody_tr = $("#product_info_table tbody tr").length;
      var row_id = count_table_tbody_tr + 1;

      $.ajax({
          url: base_url + '/orders/getTableProductRow/',
          type: 'post',
          dataType: 'json',
          success:function(response) {
            
              // console.log(reponse.x);
               var html = '<tr id="row_'+row_id+'">'+
                   '<td>'+ 
                    '<select class="form-control select_group product" data-row-id="'+row_id+'" id="product_'+row_id+'" name="product[]" style="width:100%;" onchange="getProductData('+row_id+')">'+
                        '<option value=""></option>';
                        $.each(response, function(index, value) {
                          html += '<option value="'+value.id+'">'+value.name+'</option>';             
                        });
                        
                      html += '</select>'+
                    '</td>'+ 
                    '<td><input type="number" name="qty[]" id="qty_'+row_id+'" class="form-control" onkeyup="getTotal('+row_id+')"></td>'+
                    '<td><input type="text" name="rate[]" id="rate_'+row_id+'" class="form-control" disabled><input type="hidden" name="rate_value[]" id="rate_value_'+row_id+'" class="form-control"></td>'+
                    '<td><input type="text" name="amount[]" id="amount_'+row_id+'" class="form-control" disabled><input type="hidden" name="amount_value[]" id="amount_value_'+row_id+'" class="form-control"></td>'+
                    '<td><button type="button" class="btn btn-default" onclick="removeRow(\''+row_id+'\')"><i class="fa fa-close"></i></button></td>'+
                    '</tr>';

                if(count_table_tbody_tr >= 1) {
                $("#product_info_table tbody tr:last").after(html);  
              }
              else {
                $("#product_info_table tbody").html(html);
              }

              $(".product").select2();

          }
        });

      return false;
    });
      
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

    $(skudelete).on('input',function(e){
      if ($(skudelete).val()!=""){
      $.ajax({
        url: "<?php echo base_url('dashboard/getbysku') ?>",
        type: 'POST',
        data:{skucreate:$(skudelete).val()},
        dataType: 'text',
        cache: false,
        success: function(data) {
            var table = (JSON.parse(data).data)[0];
            if (typeof table != "undefined"){
              namedelete.value = table[1];
            } else {
              namedelete.value = "";
            }
        },
        error: function(thrownError) {
            alert(JSON.stringify(thrownError));
        }
        
    });
      }
    });
    
  </script>
