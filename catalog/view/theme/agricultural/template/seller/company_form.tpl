<?php echo $header; ?>
<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-10'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>" style="width: 80%; padding-left: 5px;"><?php echo $content_top; ?>
            <div class="page-header" style="margin: 0px;">
                <div class="container-fluid">
                    <div class="pull-right">
                        <button type="submit" onclick="return validateForm(this);" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $heading_title; ?></h3>
                    </div>
                    <div class="panel-body">
                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-general">
                                    <ul class="nav nav-tabs" id="language">
                                        <?php foreach ($languages as $language) { ?>
                                        <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                                        <?php } ?>
                                    </ul>
                                    <div class="tab-content">
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                                                <div class="col-sm-10">
                                                        <textarea name="company_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['description'] : ''; ?></textarea>
                                                </div>
                                            </div>
<?php if(isset($display_contact) && $display_contact ==1){ ?>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact1; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content1]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content1'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact2; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content2]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content2'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact3; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content3]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content3'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact4; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content4]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content4'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>
<?php } ?>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script type="text/javascript"><!--
                <?php foreach ($languages as $language) { ?>
                    $('#input-description<?php echo $language['language_id']; ?>').summernote({
                        height: 300
                    });
                <?php } ?>
                //--></script>
            <script type="text/javascript"><!--
                $(document).ready(function(){
                    if ($('#input-system-category').val()) {
                        $('#input-system-category').trigger('change');
                    }
                });

                function validateForm(obj) {
                    var _form = $(obj).attr('form');
                    var _pass = true;

                    $('#'+_form).find('.form-group.required input[type=text]').each(function(){
                        if (!$(this).val()) {
                            _pass = false;
                            if ($(this).parent().find('.text-danger').length > 0) {
                                $(this).parent().find('.text-danger').first().html('请完成必填项');
                            } else {
                                $(this).after('<div class="text-danger">请完成必填项</div>');
                            }

                            $(this).closest('.form-group').addClass('has-error');

                            return false;
                        }
                    });

                    if (!_pass) {
                        alert('请检查必填项！');
                    }
                    return _pass;
                }

                // Manufacturer
                $('input[name=\'manufacturer\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/manufacturer/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                json.unshift({
                                    manufacturer_id: 0,
                                    name: '<?php echo $text_none; ?>'
                                });

                                response($.map(json, function(item) {
                                    return {
                                        label: item['name'],
                                        value: item['manufacturer_id']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('input[name=\'manufacturer\']').val(item['label']);
                        $('input[name=\'manufacturer_id\']').val(item['value']);
                    }
                });

                // Category
                $('input[name=\'category\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/category/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        label: item['name'],
                                        value: item['category_id']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('input[name=\'category\']').val('');

                        $('#product-category' + item['value']).remove();

                        $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
                    }
                });

                $('#product-category').delegate('.fa-minus-circle', 'click', function() {
                    $(this).parent().remove();
                });

                // Filter
                $('input[name=\'filter\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/filter/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        label: item['name'],
                                        value: item['filter_id']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('input[name=\'filter\']').val('');

                        $('#product-filter' + item['value']).remove();

                        $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
                    }
                });

                $('select[name=\'filter_group\']').on('change', function(){
                    if ($(this).val() == '0') return false;
                    var group_id = $(this).val();
                    $.ajax({
                        url: 'index.php?route=seller/filter/getFiltersByGroup&group_id=' +  encodeURIComponent(group_id),
                        dataType: 'json',
                        success: function(json) {
                            $.map(json, function(item) {
                                $('#product-filter' + item['filter_id']).remove();
                                $('#product-filter').append('<div id="product-filter' + item['filter_id'] + '"><i class="fa fa-minus-circle"></i> ' + item['name'] + '<input type="hidden" name="product_filter[]" value="' + item['filter_id'] + '" /></div>');
                            });
                        }
                    });
                });

                $('#product-filter').delegate('.fa-minus-circle', 'click', function() {
                    $(this).parent().remove();
                });

                // Downloads
                $('input[name=\'download\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/download/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        label: item['name'],
                                        value: item['download_id']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('input[name=\'download\']').val('');

                        $('#product-download' + item['value']).remove();

                        $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
                    }
                });

                $('#product-download').delegate('.fa-minus-circle', 'click', function() {
                    $(this).parent().remove();
                });

                // Related
                $('input[name=\'related\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/product/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        label: item['name'],
                                        value: item['product_id']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        $('input[name=\'related\']').val('');

                        $('#product-related' + item['value']).remove();

                        $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
                    }
                });

                $('#product-related').delegate('.fa-minus-circle', 'click', function() {
                    $(this).parent().remove();
                });
                //--></script>

            <script type="text/javascript"><!--
                $('#tab-general #language a:first').tab('show');
                $('#option a:first').tab('show');
                //--></script>
            <script type="text/javascript"><!--
                /*$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
                 e.preventDefault();
                 var node = this;

                 $('#form-upload').remove();

                 $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

                 $('#form-upload input[name=\'file\']').trigger('click');

                 if (typeof timer != 'undefined') {
                 clearInterval(timer);
                 }

                 timer = setInterval(function() {
                 if ($('#form-upload input[name=\'file\']').val() != '') {
                 clearInterval(timer);

                 $.ajax({
                 url: 'index.php?route=tool/upload/image',
                 type: 'post',
                 dataType: 'json',
                 data: new FormData($('#form-upload')[0]),
                 cache: false,
                 contentType: false,
                 processData: false,
                 beforeSend: function() {
                 $(node).parent().find('.text-danger').remove();
                 $(node).parent().find('input').after('<div class="text-danger">Loading</div>');
                 },
                 complete: function() {
                 $(node).parent().find('.text-danger').remove();
                 },
                 success: function(json) {
                 $(node).parent().find('.text-danger').remove();

                 if (json['error']) {
                 $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                 }

                 if (json['success']) {
                 //alert(json['success']);

                 $(node).parent().find('input').attr('value', json['code']);
                 $(node).parent().find('img').attr('src', json['src']);
                 }
                 },
                 error: function(xhr, ajaxOptions, thrownError) {
                 alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                 }
                 });
                 }
                 }, 500);
                 });*/
                //--></script>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>