

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
            <h3 class="box-title">Remover Producto(s) ya existentes</h3>
          </div>
          <!-- /.box-header -->
          <form role="form" action="<?php echo base_url('dashboard/substractbysku') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                <div class="form-group">
                  <label for="sku_create">SKU</label>
                  <input type="text" class="form-control" id="skudelete" name="skudelete" placeholder="Enter sku" autocomplete="off" />
                </div>

                <div>
                  <label for="sku_create">Nombre del producto</label>
                  <input type="text" class="form-control" id="namedelete" name="namedelete" placeholder="Enter sku" autocomplete="off" disabled />
                </div>

                <div class="form-group">
                  <label for="qty_create">Qty</label>
                  <input value="1" type="text" class="form-control" id="qtydelete" name="qtydelete" placeholder="Enter Qty" autocomplete="off" />
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save Changes</button>
              </div>
            </form>
          <!-- /.box-body -->
        </div>

       

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <script type="text/javascript">
    var skucreate = document.getElementById("skucreate");
    var namecreate = document.getElementById("namecreate");
    var skudelete = document.getElementById("skudelete");
    var namedelete = document.getElementById("namedelete");
    $(document).ready(function() {
      $("#dashboardMainMenu").addClass('active');
      
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
