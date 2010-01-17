<center>
<h2>Statement of Invoices</h2>
</center>
{if $menu != false}

{if $smarty.post.submit == null}
<div class="welcome">
{else}
<div class="">
{/if}
<form name="frmpost" action="index.php?module=reports&amp;view=report_statement" method="post">

       <table align="center">

               <tr>
                      <td class="details_screen">
                               {$LANG.biller}
                       </td>
                       <td>
                           {if $billers == null }
                              <p><em>{$LANG.no_billers}</em></p>
                           {else}
                            <select name="biller_id">
                            {foreach from=$billers item=list_biller}
                            <option {if $list_biller.id == $biller_id} selected {/if} value="{$list_biller.id}">{$list_biller.name}</option>
                            {/foreach}
                            </select>
                            {/if}
                        </td>
                </tr>
                <tr>
                    <td class="details_screen">
                        {$LANG.customer}
                    </td>
                    <td>
                        {if $customers == null }
                        <em>{$LANG.no_customers}</em>
                        {else}
                            <select name="customer_id">
                            {foreach from=$customers item=list_customer}
                                <option {if $list_customer.id == $customer_id} selected {/if} value="{$list_customer.id}">{$list_customer.name}</option>
                            {/foreach}
                            </select>
                        {/if}
                    </td>
                </tr>
    <tr>
        <td wrap="nowrap" class="details_screen">Start date (YYYY-MM-DD)
	</td><td>
                <input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="start_date" id="date1" value='{$start_date}' />   
         </td>
	</tr>
	<tr>
        <td wrap="nowrap" class="details_screen"  >End date (YYYY-MM-DD)
	</td><td>
                <input type="text" class="validate[required,custom[date],length[0,10]] date-picker" size="10" name="end_date" id="date1" value='{$end_date}' />   
            </td>
    </tr>
	<tr>
	<td class="details_screen">
		Show only unpaid invoices
	</td>
	<td class="">
		<input type="checkbox" name="show_only_unpaid"  {if $show_only_unpaid == "yes"} checked {/if} value="yes">
	</td>
	</tr>

<tr>
<td colspan="2"><br />
<table class="buttons" align="center">
    <tr>
        <td>
            <button type="submit" class="positive" name="submit" value="statement_report">
                <img class="button_img" src="./images/common/tick.png" alt="" /> 
                Run report
            </button>

        </td>
    </tr>
</table>
</td>
</tr>
</table>
</form>
</div>
<br />
<br />
	{if $smarty.post.submit != null}
	<span class="welcome">
			<a title="{$LANG.print_preview_tooltip} {$preference.pref_inv_wording} {$invoice.id}" href="index.php?module=export&amp;view=statement&amp;biller_id={$biller_id}&amp;customer_id={$customer_id}&amp;start_date={$start_date}&amp;end_date={$end_date}&amp;show_only_unpaid={$show_only_unpaid}&amp;format=print"><img src='images/common/printer.png' class='action' />&nbsp;{$LANG.print_preview}</a>
			 &nbsp;&nbsp; 
			 <!-- EXPORT TO PDF -->
			<a title="{$LANG.export_tooltip} {$preference.pref_inv_wording} {$invoice.id} {$LANG.export_pdf_tooltip}" href="index.php?module=export&amp;view=invoice&amp;id={$invoice.id}&amp;format=pdf"><img src='images/common/page_white_acrobat.png' class='action' />&nbsp;{$LANG.export_pdf}</a>
			 &nbsp;&nbsp; 
			<a title="{$LANG.export_tooltip} {$preference.pref_inv_wording} {$invoice.id} {$LANG.export_xls_tooltip} .{$config->export->spreadsheet} {$LANG.format_tooltip}" href="index.php?module=export&amp;view=invoice&amp;id={$invoice.id}&amp;format=file&amp;filetype={$spreadsheet}"><img src='images/common/page_white_excel.png' class='action' />&nbsp;{$LANG.export_as} .{$spreadsheet}</a>
			 &nbsp;&nbsp; 
			<a title="{$LANG.export_tooltip} {$preference.pref_inv_wording} {$invoice.id} {$LANG.export_doc_tooltip} .{$config->export->wordprocessor} {$LANG.format_tooltip}" href="index.php?module=export&amp;view=invoice&amp;id={$invoice.id}&amp;format=file&amp;filetype={$word_processor}"><img src='images/common/page_white_word.png' class='action' />&nbsp;{$LANG.export_as} .{$wordprocessor} </a>
			 &nbsp;&nbsp; 
			<a title="{$LANG.email} {$preference.pref_inv_wording} {$invoice.id}" href="index.php?module=invoices&amp;view=email&amp;stage=1&amp;id={$invoice.id}"><img src='images/common/mail-message-new.png' class='action' />&nbsp;{$LANG.email}</a>
	</span>
	<br />
	<br />
	<br />
	{/if}

{/if}
{if $smarty.post.submit != null OR $module == export}

{if $menu == false}
<hr />
<br />
{/if}
<div class="align_left">
<strong>{$LANG.biller}:</strong> {$biller_details.name} <br />
<strong>{$LANG.customer}:</strong> {$customer_details.name} <br />
<br />	
</div>
{if $start_date != null AND $end_date != null}
<div class="align_left"><strong>Statement for the period {$start_date} to {$end_date}</strong></div>
<br />
{/if}

<table align="center" width="100%">
    <tr>
        <td  class="details_screen">
            <b>ID</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
        <td  class="details_screen">
            <b>Date</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td  class="details_screen">
            <b>Biller</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td  class="details_screen">
            <b>Customer</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td  class="details_screen">
            <b>{$LANG.total}</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td  class="details_screen">
            <b>{$LANG.paid}</b>
        </td>
        <td>
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            <b>Owing</b>
        </td>
	</tr>
 {section name=invoice loop=$invoices}
    {if $invoices[invoice].preference != $invoices[invoice.index_prev].preference AND $smarty.section.invoice.index != 0}   
        <tr><td><br /></td></tr>
    {/if}
    <tr>
        <td class="details_screen">{$index}
            {$invoices[invoice].preference}
            {$invoices[invoice].index_id}
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            {$invoices[invoice].date}
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            {$invoices[invoice].biller}
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            {$invoices[invoice].customer}
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            {$invoices[invoice].invoice_total|siLocal_number}
        </td>
        <td>
            &nbsp;
            &nbsp;
        </td>
        <td class="details_screen">
            {$invoices[invoice].INV_PAID|siLocal_number} 
        </td>
        <td>
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
            &nbsp;
        </td>
        <td  class="details_screen">
            {$invoices[invoice].owing|siLocal_number}
        </td>
	</tr>
 {/section}
 </table>
{/if}