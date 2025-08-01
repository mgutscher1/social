{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header">
  <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_product_teardown_elol.svg">
  <div class="circle-2"></div>
  <div class="circle-3"></div>
  <div class="inner">
    <h2>{__("Getting Started")}</h2>
    <p class="text-xlg">{__("This information will let us know more about you")}</p>
  </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="{if $system['fluid_design']}container-fluid{else}container{/if}" style="margin-top: -25px;">
  <div class="row">
    <div class="col-12 col-md-10 mx-md-auto">
      <div class="card shadow">
        <div class="card-body">

          <!-- nav -->
          <ul class="nav nav-pills nav-fill nav-started mb30 js_wizard-steps">
            <li class="nav-item">
              <a class="nav-link active" href="#step-1">
                <h4 class="mb5">{__("Step 1")}</h4>
                <p class="mb0">{__("Upload your photo")}</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#step-2">
                <h4 class="mb5">{__("Step 2")}</h4>
                <p class="mb0">{__("Update your info")}</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#step-3">
                <h4 class="mb5">{__("Step 3")}</h4>
                <p class="mb0">
                  {if $friends || $followers || $pages || $groups}
                    {__("Manage Connections")}
                  {else}
                    {__("Add Friends")}
                  {/if}
                </p>
              </a>
            </li>
          </ul>
          <!-- nav -->

          <!-- tabs -->
          <div class="js_wizard-content" id="step-1">
            <div class="text-center">
              <h3 class="mb5">{__("Welcome")} <span class="text-primary">{$user->_data['user_fullname']}</span></h3>
              <p class="mb20">{__("Let's start with your photo")}</p>
            </div>

            <!-- profile-avatar -->
            <div class="position-relative" style="height: 170px;">
              <div class="profile-avatar-wrapper static">
                <img src="{$user->_data['user_picture']}" alt="">

                <!-- buttons -->
                <div class="profile-avatar-change">
                  <i class="fa fa-camera js_x-uploader" data-handle="picture-user"></i>
                </div>
                <div class="profile-avatar-change-loader">
                  <div class="progress x-progress">
                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
                <div class="profile-avatar-crop {if $user->_data['user_picture_default'] || !$user->_data['user_picture_id']}x-hidden{/if}">
                  <i class="fa fa-crop-alt js_init-crop-picture" data-image="{$user->_data['user_picture_full']}" data-handle="user" data-id="{$user->_data['user_id']}"></i>
                </div>
                <div class="profile-avatar-delete {if $user->_data['user_picture_default']}x-hidden{/if}">
                  <i class="fa fa-trash js_delete-picture" data-handle="picture-user"></i>
                </div>
                <!-- buttons -->
              </div>
            </div>
            <!-- profile-avatar -->

            <!-- buttons -->
            <div class="clearfix mt20">
              <button id="activate-step-2" class="btn btn-primary float-end">{__("Next")}<i class="fas fa-arrow-circle-right ml5"></i></button>
            </div>
            <!-- buttons -->
          </div>

          <div class="js_wizard-content x-hidden" id="step-2">
            <div class="text-center">
              <h3 class="mb5">{__("Update your info")}</h3>
              <p class="mb20">{__("Share your information with our community")}</p>
            </div>

            <form class="js_ajax-forms" data-url="users/started.php?do=update">
              <div class="heading-small mb20">
                {__("Location")}
              </div>
              <div class="pl-md-4">
                <div class="form-group">
                  <label class="form-label" for="country">{__("Country")}</label>
                  <select class="form-select" name="country" id="country">
                    <option value="none">{__("Select Country")}</option>
                    {foreach $countries as $country}
                      <option {if $user->_data['user_country'] == $country['country_id']}selected{/if} value="{$country['country_id']}">{$country['country_name']}</option>
                    {/foreach}
                  </select>
                </div>
                {if $system['location_info_enabled']}
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label class="form-label" for="city">{__("Current City")}</label>
                      <input type="text" class="form-control js_geocomplete" name="city" id="city" value="{$user->_data['user_current_city']}">
                    </div>
                    <div class="form-group col-md-6">
                      <label class="form-label" for="hometown">{__("Hometown")}</label>
                      <input type="text" class="form-control js_geocomplete" name="hometown" id="hometown" value="{$user->_data['user_hometown']}">
                    </div>
                  </div>
                {/if}
              </div>

              {if $system['work_info_enabled']}
                <div class="divider"></div>

                <div class="heading-small mb20">
                  {__("Work")}
                </div>
                <div class="pl-md-4">
                  <div class="form-group">
                    <label class="form-label" for="work_title">{__("Work Title")}</label>
                    <input type="text" class="form-control" name="work_title" id="work_title" value="{$user->_data['user_work_title']}">
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label class="form-label" for="work_place">{__("Work Place")}</label>
                      <input type="text" class="form-control" name="work_place" id="work_place" value="{$user->_data['user_work_place']}">
                    </div>
                    <div class="form-group col-md-6">
                      <label class="form-label" for="work_url">{__("Work Website")}</label>
                      <input type="text" class="form-control" name="work_url" id="work_url" value="{$user->_data['user_work_url']}">
                    </div>
                  </div>
                </div>
              {/if}

              {if $system['education_info_enabled']}
                <div class="divider"></div>

                <div class="heading-small mb20">
                  {__("Education")}
                </div>
                <div class="pl-md-4">
                  <div class="form-group">
                    <label class="form-label" for="edu_major">{__("Major")}</label>
                    <input type="text" class="form-control" name="edu_major" id="edu_major" value="{$user->_data['user_edu_major']}">
                  </div>
                  <div class="row">
                    <div class="form-group col-md-6">
                      <label class="form-label" for="edu_school">{__("School")}</label>
                      <input type="text" class="form-control" name="edu_school" id="edu_school" value="{$user->_data['user_edu_school']}">
                    </div>
                    <div class="form-group col-md-6">
                      <label class="form-label" for="edu_class">{__("Class")}</label>
                      <input type="text" class="form-control" name="edu_class" id="edu_class" value="{$user->_data['user_edu_class']}">
                    </div>
                  </div>
                </div>
              {/if}

              <!-- success -->
              <div class="alert alert-success x-hidden"></div>
              <!-- success -->

              <!-- error -->
              <div class="alert alert-danger x-hidden"></div>
              <!-- error -->

              <!-- buttons -->
              <div class="clearfix mt20">
                <div class="float-end">
                  <button type="submit" class="btn btn-success"><i class="fas fa-check-circle mr5"></i>{__("Save Changes")}</button>
                  <button type="button" class="btn btn-primary" id="activate-step-3">{__("Next")}<i class="fas fa-arrow-circle-right ml5"></i></button>
                </div>
              </div>
              <!-- buttons -->
            </form>
          </div>

          <div class="js_wizard-content x-hidden" id="step-3">
            <div class="text-center">
              <h3 class="mb5">
                {if $friends || $followers || $pages || $groups}
                  {__("Manage Connections")}
                {else}
                  {if $system['friends_enabled']}{__("Add Friends")}{else}{__("Add Followers")}{/if}
                {/if}
              </h3>
              <p class="mb20">{__("Get latest activities from our popular users")}</p>
            </div>

            <form class="js_ajax-forms" data-url="users/started.php?do=finish">
              {if $friends || $followers || $pages || $groups}
                <!-- friends -->
                {if $friends}
                  <div class="heading-small mb20">
                    {if $system['friends_enabled']}{__("Friends")}{else}{__("Followers")}{/if}
                  </div>
                  <ul class="row">
                    {foreach $friends as $_user}
                      {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"] _darker=true}
                    {/foreach}
                  </ul>
                {/if}
                <!-- friends -->
                <!-- followers -->
                {if $followers}
                  <div class="divider"></div>
                  <div class="heading-small mb20">
                    {__("Followers")}
                  </div>
                  <ul class="row">
                    {foreach $followers as $_user}
                      {include file='__feeds_user.tpl' _tpl="box" _connection=$_user["connection"] _darker=true}
                    {/foreach}
                  </ul>
                {/if}
                <!-- followers -->
                <!-- pages -->
                {if $pages}
                  <div class="divider"></div>
                  <div class="heading-small mb20">
                    {__("Pages")}
                  </div>
                  <ul class="row">
                    {foreach $pages as $_page}
                      {include file='__feeds_page.tpl' _tpl="box" _darker=true}
                    {/foreach}
                  </ul>
                {/if}
                <!-- pages -->
                <!-- groups -->
                {if $groups}
                  <div class="divider"></div>
                  <div class="heading-small mb20">
                    {__("Groups")}
                  </div>
                  <ul class="row">
                    {foreach $groups as $_group}
                      {include file='__feeds_group.tpl' _tpl="box" _darker=true}
                    {/foreach}
                  </ul>
                {/if}
                <!-- groups -->
              {else}
                <!-- new people -->
                {if $new_people}
                  <ul class="row">
                    {foreach $new_people as $_user}
                      {include file='__feeds_user.tpl' _tpl="box" _connection="add" _darker=true}
                    {/foreach}
                  </ul>
                {/if}
                <!-- new people -->
              {/if}

              <!-- success -->
              <div class="alert alert-success x-hidden"></div>
              <!-- success -->

              <!-- error -->
              <div class="alert alert-danger x-hidden"></div>
              <!-- error -->

              <!-- buttons -->
              <div class="clearfix mt20">
                <button type="submit" class="btn btn-danger float-end"><i class="fas fa-check-circle mr5"></i>{__("Finish")}</button>
              </div>
              <!-- buttons -->
            </form>
          </div>
          <!-- tabs -->

        </div>
      </div>
    </div>
  </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}

<script>
  $(function() {

    var wizard_steps = $('.js_wizard-steps li a');
    var wizard_content = $('.js_wizard-content');

    wizard_content.hide();

    wizard_steps.click(function(e) {
      e.preventDefault();
      var $target = $($(this).attr('href'));
      if (!$(this).hasClass('disabled')) {
        wizard_steps.removeClass('active');
        $(this).addClass('active');
        wizard_content.hide();
        $target.show();
      }
    });

    $('.js_wizard-steps li a.active').trigger('click');

    $('#activate-step-2').on('click', function(e) {
      $('.js_wizard-steps li:eq(1) a').removeClass('disabled');
      $('.js_wizard-steps li a[href="#step-2"]').trigger('click');
    });

    $('#activate-step-3').on('click', function(e) {
      $('.js_wizard-steps li:eq(2) a').removeClass('disabled');
      $('.js_wizard-steps li a[href="#step-3"]').trigger('click');
    });

  });
</script>