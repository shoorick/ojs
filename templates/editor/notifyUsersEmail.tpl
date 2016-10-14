{$body}

{$journal->getLocalizedTitle()|strip_tags}
{$issue->getIssueIdentification()|strip_tags}
{translate key="issue.toc"}
{url page="issue" op="view" path=$issue->getBestIssueId()}

{foreach name=sections from=$publishedArticles item=section key=sectionId}
{if $section.title}{$section.title}{/if}

--------
{foreach from=$section.articles item=article}
{$article->getLocalizedTitle()|strip_tags}{if $article->getPages()} ({$article->getPages()}){/if}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
{foreach from=$article->getAuthors() item=author name=authorList}
	{$author->getLocalizedFullName()}{if !$smarty.foreach.authorList.last},{/if}
{/foreach}
{/if}

{/foreach}

{/foreach}
{literal}{$templateSignature}{/literal}
