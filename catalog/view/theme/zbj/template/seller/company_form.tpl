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

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content1]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content1'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content2]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content2'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content3]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content3'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" style="" for="input-description<?php echo $language['language_id']; ?>"><?php echo $text_Brief_contact; ?></label>
                                                <div class="col-sm-10">
                                                    <textarea name="company_description[<?php echo $language['language_id']; ?>][contact_content4]" rows="1" placeholder="<?php echo $text_Brief_contact; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control">
                                                        <?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_content4'] : ''; ?>
                                                    </textarea>
                                                </div>
                                            </div>

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
                function getFilters(obj) {
                    var product_filters = <?php echo json_encode($product_filters); ?>;
                    var parent_id = $(obj).find("option:selected").data('path');
                    if (parent_id == 0) parent_id = $(obj).val();

                    $.ajax({
                        url: 'index.php?route=seller/filter/autocomplete&filter_category=' +  parent_id,
                        dataType: 'json',
                        success: function(json) {
                            var _html = '<ul id="filter-group-data">';
                            $.map(json, function(group) {
                                var _name = group.name.split('_');
                                _name = _name.pop();
                                var _li = '<li id=fg_"' + group.filter_group_id + '"><strong>' + _name + ': </strong>';
                                $.map(group.filter, function(filter) {
                                    var _checked = '';
                                    if (typeof product_filters[filter.filter_id] !== 'undefined') _checked = ' checked="checked"';
                                    _li += ' <input type="checkbox" name="product_filter[]" value="' + filter.filter_id + '"' + _checked + ' />' + filter.name + '&nbsp;&nbsp;';
                                });
                                _li += '</li>';
                                _html += _li;
                            });
                            $('#filter-group-data').remove();
                            $('#product-filter').append(_html);
                        }
                    });
                }

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
                var attribute_row = <?php echo $attribute_row; ?>;
                var attribute_data = <?php echo json_encode($attribute_groups); ?>;

                function addGroupAttribute(group_id) {
                    if (typeof attribute_data[group_id] !== 'undefined' && attribute_data[group_id]['attributes'].length > 0) {
                        $('#attribute tbody').html('');
                        attribute_row = 0;
                        for (var i=0; i<attribute_data[group_id]['attributes'].length; i++) {
                            var _attr = attribute_data[group_id]['attributes'][i];
                            html  = '<tr id="attribute-row' + attribute_row + '">';
                            html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
                            html += '  <td class="text-left">';
                        <?php foreach ($languages as $language) { ?>
                                html += '<div class="input-group"><span class="input-group-addon"><img src="/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
                            <?php } ?>
                            html += '  </td>';
                            html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                            html += '</tr>';

                            $('#attribute tbody').append(html);

                            //attributeautocomplete(attribute_row);
                            $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(_attr.name);
                            $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(_attr.attribute_id);

                            attribute_row++;
                        }
                    }
                }

                function addAttribute() {
                    html  = '<tr id="attribute-row' + attribute_row + '">';
                    html += '  <td class="text-left" style="width: 20%;"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="<?php echo $entry_attribute; ?>" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
                    html += '  <td class="text-left">';
                <?php foreach ($languages as $language) { ?>
                        html += '<div class="input-group"><span class="input-group-addon"><img src="admin/view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="<?php echo $entry_text; ?>" class="form-control"></textarea></div>';
                    <?php } ?>
                    html += '  </td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#attribute tbody').append(html);

                    attributeautocomplete(attribute_row);

                    attribute_row++;
                }

                function attributeautocomplete(attribute_row) {
                    $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
                        'source': function(request, response) {
                            $.ajax({
                                url: 'index.php?route=seller/attribute/autocomplete&filter_name=' +  encodeURIComponent(request),
                                dataType: 'json',
                                success: function(json) {
                                    response($.map(json, function(item) {
                                        return {
                                            category: item.attribute_group,
                                            label: item.name,
                                            value: item.attribute_id
                                        }
                                    }));
                                }
                            });
                        },
                        'select': function(item) {
                            $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
                            $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
                        }
                    });
                }

                $('#attribute tbody tr').each(function(index, element) {
                    attributeautocomplete(index);
                });
                //--></script>
            <script type="text/javascript"><!--
                var option_row = <?php echo $option_row; ?>;

                $('input[name=\'option\']').autocomplete({
                    'source': function(request, response) {
                        $.ajax({
                            url: 'index.php?route=seller/option/autocomplete&filter_name=' +  encodeURIComponent(request),
                            dataType: 'json',
                            success: function(json) {
                                response($.map(json, function(item) {
                                    return {
                                        category: item['category'],
                                        label: item['name'],
                                        value: item['option_id'],
                                        type: item['type'],
                                        option_value: item['option_value']
                                    }
                                }));
                            }
                        });
                    },
                    'select': function(item) {
                        html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
                        html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
                        html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
                        html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
                        html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

                        html += '	<div class="form-group">';
                        html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
                        html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
                        html += '	      <option value="1"><?php echo $text_yes; ?></option>';
                        html += '	      <option value="0"><?php echo $text_no; ?></option>';
                        html += '	  </select></div>';
                        html += '	</div>';

                        if (item['type'] == 'text') {
                            html += '	<div class="form-group">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'textarea') {
                            html += '	<div class="form-group">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'file') {
                            html += '	<div class="form-group" style="display: none;">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="form-control" /></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'date') {
                            html += '	<div class="form-group">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'time') {
                            html += '	<div class="form-group">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'datetime') {
                            html += '	<div class="form-group">';
                            html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
                            html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                            html += '	</div>';
                        }

                        if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
                            html += '<div class="table-responsive">';
                            html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                            html += '  	 <thead>';
                            html += '      <tr>';
                            html += '        <td class="text-left" style="width: 15%;"><?php echo $entry_option_value; ?></td>';
                            html += '        <td class="text-right"><?php echo $entry_quantity; ?></td>';
                            html += '        <td class="text-left" style="width: 12%;"><?php echo $entry_subtract; ?></td>';
                            html += '        <td class="text-right"><?php echo $entry_price; ?></td>';
                            html += '        <td class="text-right"><?php echo $entry_option_points; ?></td>';
                            html += '        <td class="text-right"><?php echo $entry_weight; ?></td>';
                            html += '        <td></td>';
                            html += '      </tr>';
                            html += '  	 </thead>';
                            html += '  	 <tbody>';
                            html += '    </tbody>';
                            html += '    <tfoot>';
                            html += '      <tr>';
                            html += '        <td colspan="6"></td>';
                            html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                            html += '      </tr>';
                            html += '    </tfoot>';
                            html += '  </table>';
                            html += '</div>';

                            html += '  <select id="option-values' + option_row + '" style="display: none;">';

                            for (i = 0; i < item['option_value'].length; i++) {
                                html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                            }

                            html += '  </select>';
                            html += '</div>';
                        }

                        $('#tab-option .tab-content').append(html);

                        $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

                        $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

                        $('.date').datetimepicker({
                            pickTime: false
                        });

                        $('.time').datetimepicker({
                            pickDate: false
                        });

                        $('.datetime').datetimepicker({
                            pickDate: true,
                            pickTime: true
                        });

                        option_row++;
                    }
                });
                //--></script>
            <script type="text/javascript"><!--
                var option_value_row = <?php echo $option_value_row; ?>;

                function addOptionValue(option_row) {
                    html  = '<tr id="option-value-row' + option_value_row + '">';
                    html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
                    html += $('#option-values' + option_row).html();
                    html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
                    html += '    <option value="1"><?php echo $text_yes; ?></option>';
                    html += '    <option value="0"><?php echo $text_no; ?></option>';
                    html += '  </select></td>';
                    html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
                    html += '    <option value="+">+</option>';
                    html += '    <option value="-">-</option>';
                    html += '  </select>';
                    html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
                    html += '    <option value="+">+</option>';
                    html += '    <option value="-">-</option>';
                    html += '  </select>';
                    html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
                    html += '    <option value="+">+</option>';
                    html += '    <option value="-">-</option>';
                    html += '  </select>';
                    html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#option-value' + option_row + ' tbody').append(html);
                    $('[rel=tooltip]').tooltip();

                    option_value_row++;
                }
                //--></script>
            <script type="text/javascript"><!--
                var discount_row = <?php echo $discount_row; ?>;

                function addDiscount() {
                    html  = '<tr id="discount-row' + discount_row + '">';
                    html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
                <?php foreach ($customer_groups as $customer_group) { ?>
                        html += '    <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
                    <?php } ?>
                    html += '  </select></td>';
                    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#discount tbody').append(html);

                    $('.date').datetimepicker({
                        pickTime: false
                    });

                    discount_row++;
                }
                //--></script>
            <script type="text/javascript"><!--
                var special_row = <?php echo $special_row; ?>;

                function addSpecial() {
                    html  = '<tr id="special-row' + special_row + '">';
                    html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
                <?php foreach ($customer_groups as $customer_group) { ?>
                        html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
                    <?php } ?>
                    html += '  </select></td>';
                    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left" style="width: 20%;"><div class="input-group datetime"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left" style="width: 20%;"><div class="input-group datetime"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#special tbody').append(html);

                    $('.datetime').datetimepicker({
                        pickDate: true,
                        pickTime: true
                    });

                    special_row++;
                }
                //--></script>
            <script type="text/javascript"><!--
                var auction_row = <?php echo $auction_row; ?>;

                function addAuction() {
                    html  = '<tr id="auction-row' + auction_row + '">';
                    html += '  <td class="text-left"><select name="product_auction[' + auction_row + '][customer_group_id]" class="form-control">';
                <?php foreach ($customer_groups as $customer_group) { ?>
                        html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
                    <?php } ?>
                    html += '  </select></td>';
                    html += '  <td class="text-right"><input type="text" name="product_auction[' + auction_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_auction[' + auction_row + '][base_price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_auction[' + auction_row + '][price]" value="" placeholder="<?php echo $entry_price_step; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left" style="width: 20%;"><div class="input-group datetime"><input type="text" name="product_auction[' + auction_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left" style="width: 20%;"><div class="input-group datetime"><input type="text" name="product_auction[' + auction_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD HH:mm" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(\'#auction-row' + auction_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#auction tbody').append(html);

                    $('.datetime').datetimepicker({
                        pickDate: true,
                        pickTime: true
                    });

                    auction_row++;
                }
                //--></script>
            <script type="text/javascript"><!--
                var image_row = <?php echo $image_row; ?>;

                function addImage() {
                    html  = '<tr id="image-row' + image_row + '">';
                    html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
                    html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
                    html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
                    html += '</tr>';

                    $('#images tbody').append(html);

                    image_row++;
                }
                //--></script>
            <script type="text/javascript"><!--
                var recurring_row = <?php echo $recurring_row; ?>;

                function addRecurring() {
                    recurring_row++;

                    html  = '';
                    html += '<tr id="recurring-row' + recurring_row + '">';
                    html += '  <td class="left">';
                    html += '    <select name="product_recurring[' + recurring_row + '][recurring_id]" class="form-control">>';
                <?php foreach ($recurrings as $recurring) { ?>
                        html += '      <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>';
                    <?php } ?>
                    html += '    </select>';
                    html += '  </td>';
                    html += '  <td class="left">';
                    html += '    <select name="product_recurring[' + recurring_row + '][customer_group_id]" class="form-control">>';
                <?php foreach ($customer_groups as $customer_group) { ?>
                        html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
                    <?php } ?>
                    html += '    <select>';
                    html += '  </td>';
                    html += '  <td class="left">';
                    html += '    <a onclick="$(\'#recurring-row' + recurring_row + '\').remove()" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
                    html += '  </td>';
                    html += '</tr>';

                    $('#tab-recurring table tbody').append(html);
                }
                //--></script>
            <script type="text/javascript"><!--
                $('.date').datetimepicker({
                    pickTime: false
                });

                $('.time').datetimepicker({
                    pickDate: false
                });

                $('.datetime').datetimepicker({
                    pickDate: true,
                    pickTime: true
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