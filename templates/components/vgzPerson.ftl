<div>
    <div class="el-item uk-panel uk-margin-remove-first-child">
        <div class="uk-child-width-expand uk-grid" uk-grid="">
            <div class="uk-margin-remove-first-child uk-first-column">
                <h3 class="uk-margin-top uk-margin-remove-bottom">${content.name!} <a href="mailto:${content.mail!}" class="uk-icon" uk-icon="icon: mail; ratio: 2"></a></h3>
                ${cmsfn.decode(content).text!}
            </div>
            <div class="uk-width-1-2@s"><img src="${damfn.getAssetLink(content.image)}" class="el-image" alt=""></div>
        </div>
    </div>
</div>
