{include file='_head.tpl'}
{include file='_header.tpl'}

<!-- page header -->
<div class="page-header">
  <img class="floating-img d-none d-md-block" src="{$system['system_url']}/content/themes/{$system['theme']}/images/headers/undraw_growth_analytics_8btt.svg">
  <div class="circle-2"></div>
  <div class="circle-3"></div>
  <div class="inner">
    <h2>{__("Ads Manager")}</h2>
    <p class="text-xlg">{__("Manage Ads, Create new Campaign")}</p>
  </div>
</div>
<!-- page header -->

<!-- page content -->
<div class="{if $system['fluid_design']}container-fluid{else}container{/if} sg-offcanvas" style="margin-top: -25px;">
  <div class="row">

    <!-- side panel -->
    <div class="col-12 d-block d-md-none sg-offcanvas-sidebar">
      {include file='_sidebar.tpl'}
    </div>
    <!-- side panel -->

    <!-- content panel -->
    <div class="col-12 sg-offcanvas-mainbar">

      <!-- tabs -->
      <div class="position-relative">
        <div class="content-tabs rounded-sm shadow-sm clearfix">
          <ul>
            <li class="active">
              <a href="{$system['system_url']}/ads">
                {include file='__svg_icons.tpl' icon="ads" class="main-icon mr10" width="24px" height="24px"}
                {__("Ads Campaigns")}
              </a>
            </li>
          </ul>
        </div>
      </div>
      <!-- tabs -->

      <!-- adblock-warning-message -->
      <div class="adblock-warning-message">
        {__("Turn off the ad blocker or add this web page's URL as an exception so you use ads system without any problems")}, {__("After you turn off the ad blocker, you'll need to refresh your screen")}
      </div>
      <!-- adblock-warning-message -->

      {if $view == ""}

        <!-- ads campaigns -->
        <div class="card mt20">
          <div class="card-header with-icon">
            <a class="btn btn-md btn-primary float-end" href="{$system['system_url']}/ads/new">
              <i class="fa fa-plus-circle mr5"></i>{__("New Campaign")}
            </a>
            {__("My Campaigns")}
          </div>
          <div class="card-body">
            {if $campaigns}
              <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover js_dataTable">
                  <thead>
                    <tr>
                      <th>{__("Title")}</th>
                      <th>{__("Start - End Date")}</th>
                      <th>{__("Budget")}</th>
                      <th>{__("Spend")}</th>
                      <th>{__("Bidding")}</th>
                      <th>{__("Clicks/Views")}</th>
                      <th>{__("Status")}</th>
                      <th>{__("Created")}</th>
                      <th>{__("Actions")}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach $campaigns as $campaign}
                      <tr>
                        <td>{$campaign['campaign_title']}</td>
                        <td>
                          {$campaign['campaign_start_date']|date_format:"%e/%m/%Y"} - {$campaign['campaign_end_date']|date_format:"%e/%m/%Y"}
                        </td>
                        <td>{print_money($campaign['campaign_budget']|number_format:2)}</td>
                        <td>{print_money($campaign['campaign_spend']|number_format:2)}</td>
                        <td>
                          <span class="badge bg-secondary">
                            {if $campaign['campaign_bidding'] == "click"}
                              <i class="fa fa-hand-pointer mr5"></i>{__("Click")}
                            {else}
                              <i class="fa fa-eye mr5"></i>{__("View")}
                            {/if}
                          </span>
                        </td>
                        <td>
                          {if $campaign['campaign_bidding'] == "click"}
                            {$campaign['campaign_clicks']} {__("Clicks")}
                          {else}
                            {$campaign['campaign_views']} {__("Views")}
                          {/if}
                        </td>
                        <td>
                          {if $campaign['campaign_is_declined']}
                            <span class="badge rounded-pill badge-lg bg-danger">{__("Declined")}</span>
                          {else}
                            {if !$campaign['campaign_is_approved']}
                              <span class="badge rounded-pill badge-lg bg-warning">{__("Approval Pending")}</span>
                            {else}
                              {if $campaign['campaign_is_active']}
                                <span class="badge rounded-pill badge-lg bg-success">{__("Active")}</span>
                              {else}
                                <span class="badge rounded-pill badge-lg bg-danger">{__("Not Active")}</span>
                              {/if}
                            {/if}
                          {/if}
                        </td>
                        <td>
                          <span class="js_moment" data-time="{$campaign['campaign_created_date']}">{$campaign['campaign_created_date']}</span>
                        </td>
                        <td>
                          <a data-bs-toggle="tooltip" title='{__("Edit")}' href="{$system['system_url']}/ads/edit/{$campaign['campaign_id']}" class="btn btn-sm btn-icon btn-rounded btn-primary">
                            <i class="fa fa-pencil-alt"></i>
                          </a>
                          {if $campaign['campaign_is_approved']}
                            {if $campaign['campaign_is_active']}
                              <button data-bs-toggle="tooltip" title='{__("Stop")}' class="btn btn-sm btn-icon btn-rounded btn-warning js_ads-stop-campaign" data-id="{$campaign['campaign_id']}">
                                <i class="fas fa-stop-circle"></i>
                              </button>
                            {else}
                              <button data-bs-toggle="tooltip" title='{__("Resume")}' class="btn btn-sm btn-icon btn-rounded btn-success js_ads-resume-campaign" data-id="{$campaign['campaign_id']}">
                                <i class="fas fa-play-circle"></i>
                              </button>
                            {/if}
                          {/if}
                          <button data-bs-toggle="tooltip" title='{__("Delete")}' class="btn btn-sm btn-icon btn-rounded btn-danger js_ads-delete-campaign" data-id="{$campaign['campaign_id']}">
                            <i class="fas fa-trash"></i>
                          </button>
                        </td>
                      </tr>
                    {/foreach}
                  </tbody>
                </table>
              </div>
            {else}
              {include file='_no_data.tpl'}
            {/if}
          </div>
        </div>
        <!-- ads campaigns -->

      {elseif $view == "new"}

        <!-- new campaign -->
        <div class="card mt20">
          <div class="card-header with-icon">
            <div class="float-end">
              <a href="{$system['system_url']}/ads" class="btn btn-md btn-light">
                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
              </a>
            </div>
            {__("New Campaign")}
          </div>
          <form class="js_ajax-forms" data-url="ads/campaign.php?do=create">
            <div class="card-body">
              {if $user->_data['user_wallet_balance'] == 0}
                <div class="bs-callout bs-callout-danger mt0">
                  {__("Your current wallet credit is")}: <strong>{print_money($user->_data['user_wallet_balance']|number_format:2)}</strong> {__("You need to")} <a href="{$system['system_url']}/wallet">{__("Replenish your wallet credit")}</a>
                </div>
              {/if}

              {if $system['ads_approval_enabled']}
                <div class="bs-callout bs-callout-warning mt0">
                  {__("Your campaign will need to be approved by admin before publishing")}
                </div>
              {/if}

              <div class="row">
                <!-- campaign details & target audience -->
                <div class="col-sm-6">
                  <!-- campaign details -->
                  <div class="section-title mb20">
                    <i class="fa fa-cog mr5"></i>{__("Campaign Details")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_title">{__("Campaign Title")}</label>
                    <input type="text" class="form-control" name="campaign_title" id="campaign_title">
                    <div class="form-text">
                      {__("Set a title for your campaign")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_start_date">{__("Campaign Start Date")}</label>
                    <input type="datetime-local" class="form-control" name="campaign_start_date">
                    <div class="form-text">
                      {__("Set Campaign start datetime (UTC)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_end_date">{__("Campaign End Date")}</label>
                    <input type="datetime-local" class="form-control" name="campaign_end_date">
                    <div class="form-text">
                      {__("Set Campaign end datetime (UTC)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_budget">{__("Campaign Budget")}</label>
                    <div class="input-money {$system['system_currency_dir']}">
                      <span>{$system['system_currency_symbol']}</span>
                      <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="campaign_budget">
                    </div>
                    <div class="form-text">
                      {__("Set a budget for your campaign, campaign will be paused if reached its limit")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_bidding">{__("Campaign Bidding")}</label>
                    <select class="form-select" name="campaign_bidding">
                      <option value="click">{__("Pay Per Click")} ({print_money($system['ads_cost_click'])})</option>
                      <option value="view">{__("Pay Per View")} ({print_money($system['ads_cost_view'])})</option>
                    </select>
                  </div>
                  <!-- campaign details -->

                  <!-- target audience -->
                  <div class="section-title mb20">
                    <i class="fa fa-crosshairs mr5"></i>{__("Target Audience")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="audience_countries">{__("Audience Country")}</label>
                    <select class="form-select" multiple name="audience_countries[]" id="js_ads-audience-countries">
                      {foreach $countries as $country}
                        <option value="{$country['country_id']}">{$country['country_name']}</option>
                      {/foreach}
                    </select>
                  </div>
                  <div class="form-group {if $system['genders_disabled']}x-hidden{/if}">
                    <label class="form-label" for="audience_gender">{__("Audience Gender")}</label>
                    <select class="form-select" name="audience_gender" id="js_ads-audience-gender">
                      <option value="all">{__("All")}</option>
                      {foreach $genders as $gender}
                        <option value="{$gender['gender_id']}">{$gender['gender_name']}</option>
                      {/foreach}
                    </select>
                  </div>
                  {if $system['relationship_info_enabled']}
                    <div class="form-group">
                      <label class="form-label" for="audience_relationship">{__("Audience Relationship")}</label>
                      <select class="form-select" name="audience_relationship" id="js_ads-audience-relationship">
                        <option value="all">{__("All")}</option>
                        <option value="single">{__("Single")}</option>
                        <option value="relationship">{__("In a relationship")}</option>
                        <option value="married">{__("Married")}</option>
                        <option value="complicated">{__("It's complicated")}</option>
                        <option value="separated">{__("Separated")}</option>
                        <option value="divorced">{__("Divorced")}</option>
                        <option value="widowed">{__("Widowed")}</option>
                      </select>
                    </div>
                  {/if}
                  <div class="form-group">
                    <label class="form-label" for="potential_reach">{__("Potential Reach")}</label>
                    <div class="text-lg">
                      <div class="float-end x-hidden" id="js_ads-potential-reach-loader">
                        <div class="spinner-border text-info"></div>
                      </div>
                      <i class="fa fa-users"></i> <span class="badge rounded-pill badge-lg bg-danger" id="js_ads-potential-reach">{$potential_reach}</span> {__("People")}
                    </div>
                  </div>
                  <!-- target audience -->
                </div>
                <!-- campaign details & target audience -->

                <!-- ads details -->
                <div class="col-sm-6">
                  <div class="section-title mb20">
                    <i class="fa fa-bullhorn mr5"></i>{__("Ads Details")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_title">{__("Ads Title")}</label>
                    <input type="text" class="form-control" name="ads_title" id="ads_title">
                    <div class="form-text">
                      {__("Set a title for your ads")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_description">{__("Ads Description")}</label>
                    <textarea class="form-control" name="ads_description" rows="5"></textarea>
                    <div class="form-text">
                      {__("Set a description for your ads (maximum 200 characters)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_type">{__("Advertise For")}</label>
                    <select class="form-select" name="ads_type" id="js_campaign-type">
                      <option value="url">{__("URL")}</option>
                      <option value="post">{__("Post")}</option>
                      <option value="page">{__("Page")}</option>
                      <option value="group">{__("Group")}</option>
                      <option value="event">{__("Event")}</option>
                    </select>
                    <div class="form-text">
                      {__("You can advertise for a URL or one of your posts, pages, groups or events")}
                    </div>
                  </div>
                  <div class="form-group" id="js_campaign-type-url">
                    <label class="form-label" for="ads_url">{__("Target URL")}</label>
                    <input type="text" class="form-control" name="ads_url">
                    <div class="form-text">
                      {__("Enter your URL you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group x-hidden" id="js_campaign-type-post">
                    <label class="form-label" for="ads_post_url">{__("Target post URL")}</label>
                    <input type="text" class="form-control" name="ads_post_url">
                    <div class="form-text">
                      {__("Enter your post URL you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group x-hidden" id="js_campaign-type-page">
                    <label class="form-label" for="ads_page">{__("Target Page")}</label>
                    <select class="form-select" name="ads_page">
                      <option value="none">{__("Select Page")}</option>
                      {foreach $pages as $page}
                        <option value="{$page['page_id']}">{__($page['page_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your pages you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group x-hidden" id="js_campaign-type-group">
                    <label class="form-label" for="ads_group">{__("Target Group")}</label>
                    <select class="form-select" name="ads_group">
                      <option value="none">{__("Select Group")}</option>
                      {foreach $groups as $group}
                        <option value="{$group['group_id']}">{__($group['group_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your groups you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group x-hidden" id="js_campaign-type-event">
                    <label class="form-label" for="ads_event">{__("Target Event")}</label>
                    <select class="form-select" name="ads_event">
                      <option value="none">{__("Select Event")}</option>
                      {foreach $events as $event}
                        <option value="{$event['event_id']}">{__($event['event_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your events you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group" id="js_campaign-placement">
                    <label class="form-label" for="ads_placement">{__("Ads Placement")}</label>
                    <select class="form-select" name="ads_placement">
                      <option value="newsfeed">{__("Newsfeed")}</option>
                      <option value="sidebar">{__("Sidebar")}</option>
                    </select>
                  </div>
                  <div class="form-group" id="js_campaign-image">
                    <label class="form-label" for="ads_image">{__("Ads Image")}</label>
                    <div class="x-image">
                      <button type="button" class="btn-close x-hidden js_x-image-remover" title='{__("Remove")}'>

                      </button>
                      <div class="x-image-loader">
                        <div class="progress x-progress">
                          <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                      </div>
                      <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                      <input type="hidden" class="js_x-image-input" name="ads_image">
                    </div>
                    <div class="form-text">
                      {__("The image of your ads, supported formats (JPG, PNG, GIF)")}
                    </div>
                  </div>
                </div>
                <!-- ads details -->
              </div>

              <!-- error -->
              <div class="alert alert-danger mt15 mb0 x-hidden"></div>
              <!-- error -->
            </div>
            <div class="card-footer text-end">
              <button type="submit" class="btn btn-primary">
                {__("Publish")}
              </button>
            </div>
          </form>
        </div>
        <!-- new campaign -->

      {elseif $view == "edit"}

        <!-- edit campaign -->
        <div class="card mt20">
          <div class="card-header with-icon">
            <div class="float-end">
              <a href="{$system['system_url']}/ads" class="btn btn-md btn-light">
                <i class="fa fa-arrow-circle-left mr5"></i>{__("Go Back")}
              </a>
            </div>
            {__("Edit Campaign")}
          </div>
          <form class="js_ajax-forms" data-url="ads/campaign.php?do=edit&id={$campaign['campaign_id']}">
            <div class="card-body">
              {if $user->_data['user_wallet_balance'] == 0}
                <div class="bs-callout bs-callout-danger mt0">
                  {__("Your current wallet credit is")}: <strong>{print_money($user->_data['user_wallet_balance']|number_format:2)}</strong> {__("You need to")} <a href="{$system['system_url']}/wallet">{__("Replenish your wallet credit")}</a>
                </div>
              {/if}

              {if $system['ads_approval_enabled']}
                <div class="bs-callout bs-callout-warning mt0">
                  {__("Your campaign will need to be approved by admin before publishing")}
                </div>
              {/if}

              <div class="row">
                <!-- campaign details & target audience -->
                <div class="col-sm-6">
                  <!-- campaign details -->
                  <div class="section-title mb20">
                    <i class="fa fa-cog mr5"></i>{__("Campaign Details")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_title">{__("Campaign Title")}</label>
                    <input type="text" class="form-control" name="campaign_title" value="{$campaign['campaign_title']}">
                    <div class="form-text">
                      {__("Set a title for your campaign")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_start_date">{__("Campaign Start Date")}</label>
                    <input type="datetime-local" class="form-control" name="campaign_start_date" value="{$campaign['campaign_start_date']}">
                    <div class="form-text">
                      {__("Set Campaign start datetime (UTC)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_end_date">{__("Campaign End Date")}</label>
                    <input type="datetime-local" class="form-control" name="campaign_end_date" value="{$campaign['campaign_end_date']}">
                    <div class="form-text">
                      {__("Set Campaign end datetime (UTC)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_budget">{__("Campaign Budget")}</label>
                    <div class="input-money {$system['system_currency_dir']}">
                      <span>{$system['system_currency_symbol']}</span>
                      <input type="text" class="form-control" placeholder="0.00" min="1.00" max="1000" name="campaign_budget" value="{$campaign['campaign_budget']}">
                    </div>
                    <div class="form-text">
                      {__("Set a budget for your campaign, campaign will be paused if reached its limit")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="campaign_bidding">{__("Campaign Bidding")}</label>
                    <select class="form-select" name="campaign_bidding">
                      <option {if $campaign['campaign_bidding'] == "click"}selected{/if} value="click">{__("Pay Per Click")} ({print_money($system['ads_cost_click'])})</option>
                      <option {if $campaign['campaign_bidding'] == "view"}selected{/if} value="view">{__("Pay Per View")} ({print_money($system['ads_cost_view'])})</option>
                    </select>
                  </div>
                  <!-- campaign details -->

                  <!-- target audience -->
                  <div class="section-title mb20">
                    <i class="fa fa-crosshairs mr5"></i>{__("Target Audience")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="audience_countries">{__("Audience Country")}</label>
                    <select class="form-select" multiple name="audience_countries[]" id="js_ads-audience-countries">
                      {foreach $countries as $country}
                        <option {if in_array($country['country_id'], $campaign['audience_countries'])}selected{/if} value="{$country['country_id']}">{$country['country_name']}</option>
                      {/foreach}
                    </select>
                  </div>
                  <div class="form-group {if $system['genders_disabled']}x-hidden{/if}">
                    <label class="form-label" for="audience_gender">{__("Audience Gender")}</label>
                    <select class="form-select" name="audience_gender" id="js_ads-audience-gender">
                      <option {if $campaign['audience_gender'] == "all"}selected{/if} value="all">{__("All")}</option>
                      {foreach $genders as $gender}
                        <option {if $campaign['audience_gender'] == $gender['gender_id']}selected{/if} value="{$gender['gender_id']}">{$gender['gender_name']}</option>
                      {/foreach}
                    </select>
                  </div>
                  {if $system['relationship_info_enabled']}
                    <div class="form-group">
                      <label class="form-label" for="audience_relationship">{__("Audience Relationship")}</label>
                      <select class="form-select" name="audience_relationship" id="js_ads-audience-relationship">
                        <option {if $campaign['audience_relationship'] == "all"}selected{/if} value="all">{__("All")}</option>
                        <option {if $campaign['audience_relationship'] == "single"}selected{/if} value="single">{__("Single")}</option>
                        <option {if $campaign['audience_relationship'] == "relationship"}selected{/if} value="relationship">{__("In a relationship")}</option>
                        <option {if $campaign['audience_relationship'] == "married"}selected{/if} value="married">{__("Married")}</option>
                        <option {if $campaign['audience_relationship'] == "complicated"}selected{/if} value="complicated">{__("It's complicated")}</option>
                        <option {if $campaign['audience_relationship'] == "separated"}selected{/if} value="separated">{__("Separated")}</option>
                        <option {if $campaign['audience_relationship'] == "divorced"}selected{/if} value="divorced">{__("Divorced")}</option>
                        <option {if $campaign['audience_relationship'] == "widowed"}selected{/if} value="widowed">{__("Widowed")}</option>
                      </select>
                    </div>
                  {/if}
                  <div class="form-group">
                    <label class="form-label" for="potential_reach">{__("Potential Reach")}</label>
                    <div class="text-lg">
                      <div class="float-end x-hidden" id="js_ads-potential-reach-loader">
                        <div class="spinner-border text-info"></div>
                      </div>
                      <i class="fa fa-users"></i> <span class="text-primary" id="js_ads-potential-reach">{$campaign['campaign_potential_reach']}</span> {__("People")}
                    </div>
                  </div>
                  <!-- target audience -->
                </div>
                <!-- campaign details & target audience -->

                <!-- ads details -->
                <div class="col-sm-6">
                  <div class="section-title mb20">
                    <i class="fa fa-bullhorn mr5"></i>{__("Ads Details")}
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_title">{__("Ads Title")}</label>
                    <input type="text" class="form-control" name="ads_title" id="ads_title" value="{$campaign['ads_title']}">
                    <div class="form-text">
                      {__("Set a title for your ads")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_description">{__("Ads Description")}</label>
                    <textarea class="form-control" name="ads_description" rows="5">{$campaign['ads_description']}</textarea>
                    <div class="form-text">
                      {__("Set a description for your ads (maximum 200 characters)")}
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="form-label" for="ads_type">{__("Advertise For")}</label>
                    <select class="form-select" name="ads_type" id="js_campaign-type">
                      <option {if $campaign['ads_type'] == "url"}selected{/if} value="url">{__("URL")}</option>
                      <option {if $campaign['ads_type'] == "post"}selected{/if} value="post">{__("Post")}</option>
                      <option {if $campaign['ads_type'] == "page"}selected{/if} value="page">{__("Page")}</option>
                      <option {if $campaign['ads_type'] == "group"}selected{/if} value="group">{__("Group")}</option>
                      <option {if $campaign['ads_type'] == "event"}selected{/if} value="event">{__("Event")}</option>
                    </select>
                    <div class="form-text">
                      {__("You can advertise for a URL or one of your pages, groups or events")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] != 'url'}x-hidden{/if}" id="js_campaign-type-url">
                    <label class="form-label" for="ads_url">{__("Target URL")}</label>
                    <input type="text" class="form-control" name="ads_url" value="{$campaign['ads_url']}">
                    <div class="form-text">
                      {__("Enter your URL you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] != 'post'}x-hidden{/if}" id="js_campaign-type-post">
                    <label class="form-label" for="ads_post_url">{__("Target post URL")}</label>
                    <input type="text" class="form-control" name="ads_post_url" value="{$campaign['ads_post_url']}">
                    <div class="form-text">
                      {__("Enter your post URL you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] != 'page'}x-hidden{/if}" id="js_campaign-type-page">
                    <label class="form-label" for="ads_page">{__("Target Page")}</label>
                    <select class="form-select" name="ads_page">
                      <option value="none">{__("Select Page")}</option>
                      {foreach $pages as $page}
                        <option {if $campaign['ads_page'] == $page['page_id']}selected{/if} value="{$page['page_id']}">{__($page['page_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your pages you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] != 'group'}x-hidden{/if}" id="js_campaign-type-group">
                    <label class="form-label" for="ads_group">{__("Target Group")}</label>
                    <select class="form-select" name="ads_group">
                      <option value="none">{__("Select Group")}</option>
                      {foreach $groups as $group}
                        <option {if $campaign['ads_group'] == $group['group_id']}selected{/if} value="{$group['group_id']}">{__($group['group_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your groups you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] != 'event'}x-hidden{/if}" id="js_campaign-type-event">
                    <label class="form-label" for="ads_event">{__("Target Event")}</label>
                    <select class="form-select" name="ads_event">
                      <option value="none">{__("Select Event")}</option>
                      {foreach $events as $event}
                        <option {if $campaign['ads_event'] == $event['event_id']}selected{/if} value="{$event['event_id']}">{__($event['event_title'])}</option>
                      {/foreach}
                    </select>
                    <div class="form-text">
                      {__("Select one of your events you want to advertise for")}
                    </div>
                  </div>
                  <div class="form-group {if $campaign['ads_type'] == 'post'}x-hidden{/if}" id="js_campaign-placement">
                    <label class="form-label" for="ads_placement">{__("Ads Placement")}</label>
                    <select class="form-select" name="ads_placement">
                      <option {if $campaign['ads_placement'] == "newsfeed"}selected{/if} value="newsfeed">{__("Newsfeed")}</option>
                      <option {if $campaign['ads_placement'] == "sidebar"}selected{/if} value="sidebar">{__("Sidebar")}</option>
                    </select>
                  </div>
                  <div class="form-grou  {if $campaign['ads_type'] == 'post'}x-hidden{/if}" id="js_campaign-image">
                    <label class="form-label" for="ads_image">{__("Ads Image")}</label>
                    {if $campaign['ads_image'] == ''}
                      <div class="x-image">
                        <button type="button" class="btn-close x-hidden js_x-image-remover" title='{__("Remove")}'></button>
                        <div class="x-image-loader">
                          <div class="progress x-progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                        <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                        <input type="hidden" class="js_x-image-input" name="ads_image">
                      </div>
                    {else}
                      <div class="x-image" style="background-image: url('{$system['system_uploads']}/{$campaign['ads_image']}')">
                        <button type="button" class="btn-close js_x-image-remover" title='{__("Remove")}'>

                        </button>
                        <div class="x-image-loader">
                          <div class="progress x-progress">
                            <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                        <i class="fa fa-camera fa-lg js_x-uploader" data-handle="x-image"></i>
                        <input type="hidden" class="js_x-image-input" name="ads_image" value="{$campaign['ads_image']}">
                      </div>
                    {/if}
                    <div class="form-text">
                      {__("The image of your ads, supported formats (JPG, PNG, GIF)")}
                    </div>
                  </div>
                </div>
                <!-- ads details -->
              </div>

              <!-- success -->
              <div class="alert alert-success mt15 mb0 x-hidden"></div>
              <!-- success -->

              <!-- error -->
              <div class="alert alert-danger mt15 mb0 x-hidden"></div>
              <!-- error -->
            </div>
            <div class="card-footer text-end">
              <button type="submit" class="btn btn-primary">{__("Save Changes")}</button>
            </div>
          </form>
        </div>
        <!-- edit campaign -->

      {/if}
    </div>
    <!-- content panel -->

  </div>
</div>
<!-- page content -->

{include file='_footer.tpl'}