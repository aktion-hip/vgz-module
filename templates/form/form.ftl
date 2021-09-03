[#ftl output_format="HTML"]
[#-- Need to explicitly set the output format here, so that auto escaping is enabled by default (as of Freemarker 2.3.24) --]
[#-- This will mitigate the risk of XSS attacks. --]
[#assign divIDPrefix = def.parameters.divIDPrefix!]
[#assign divClass = def.parameters.divClass!"form"]

[#if divIDPrefix?has_content]
    [#assign divID = ' id="${divIDPrefix}-${content.@id}"']
[/#if]

<div class="${divClass!}"${divID!}>
[#if actionResult == "go-to-first-page"]
    <div class="text">
        ${i18n.get("form.user.errorMessage.go-to-first-page", [cmsfn.link("website", model.view.firstPage)])}
    </div><!-- end text -->

[#elseif actionResult == "success"]
    <div class="text success">
        <h2>${model.view.successTitle!i18n['form.default.successTitle']}</h2>
        <p>${model.view.successMessage!}</p>
    </div><!-- end text success -->

[#elseif actionResult == "session-expired"]
    [#if content.formTitle?has_content]
        <h2>${content.formTitle}</h2>
    [/#if]

    <div class="text error">
        ${i18n.get("form.user.errorMessage.session-expired", [cmsfn.link("website", model.view.firstPage)])}
    </div><!-- end text error -->

[#elseif actionResult == "failure"]
    [#if content.formTitle?has_content]
        <h2>${content.formTitle}</h2>
    [/#if]

    <div class="text error">
        <ul>
            <li>${model.view.errorMessage}</li>
        </ul>
    </div><!-- end text error -->

[#else]

    <div class="text">

        [#if content.formTitle?has_content]
            <h2>${content.formTitle}</h2>
        [/#if]

        [#if content.formText?has_content]
            <p>${content.formText!}</p>
        [/#if]
        [#if model.displayNavigation?has_content && model.displayNavigation]
            <div id="step-by-step">
                <ol>
                    [#list model.previousStepsNavigation as item]
                        <li class="done"><a href="${item.href!}">${item.navigationTitle!}</a></li>
                    [/#list]
                    <li><strong><em>${i18n['nav.selected']} </em>${content.navigationTitle!content.formTitle!content.@name}</strong></li>
                    [#list model.nextStepsNavigation as item]
                        <li class="done">${item.navigationTitle!}</li>
                    [/#list]
                </ol>
            </div><!-- end step-by-step -->
        [/#if]
    </div><!-- end text -->

    [#if model.view.validationErrors?size > 0]
        <div id="formErrorsDisplay" class="text error">
            <h2>${model.view.errorTitle!i18n['form.default.errorTitle']}</h2>
            <ul>
                [#assign keys = model.view.validationErrors?keys]
                [#list keys as key]
                    <li>
                        <a href="#${key}_label">${model.view.validationErrors[key]!}</a>
                    </li>
                [/#list]
            </ul>
        </div><!-- end text error -->
    [/#if]

    <div class="form-wrapper" >
        <form id="${content.formName?default("form0")}" method="post" action="" enctype="${def.parameters.formEnctype?default("multipart/form-data")}" >
            <div class="form-item-hidden">
                <input type="hidden" name="mgnlModelExecutionUUID" value="${content.@id}" />
                <input type="hidden" name="field" value="" />
                [#if model.formState?has_content]
                    <input type="hidden" name="mgnlFormToken" value="${model.formState.token!}" />
                [/#if]
                <input type="hidden" name="csrf" value="${ctx.getAttribute('csrf')!''}" />
            </div><!-- end form-item-hidden -->

            [@cms.area name="fieldsets"/]
        </form>
    </div><!-- end form-wrapper -->

[/#if]
</div><!-- end ${divClass} -->
