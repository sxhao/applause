/*
 * generated by Xtext
 */
package de.itemis.mobilizer.ui;

import org.eclipse.ui.plugin.AbstractUIPlugin;
import org.eclipse.xtext.ui.editor.quickfix.IssueResolutionProvider;

import de.itemis.mobilizer.ui.quickfix.AppModelDslQuickfixProvider;

/**
 * Use this class to register components to be used within the IDE.
 */
public class AppModelDslUiModule extends de.itemis.mobilizer.ui.AbstractAppModelDslUiModule {
	public AppModelDslUiModule(AbstractUIPlugin plugin) {
		super(plugin);
	}
	
	@Override
	public Class<? extends IssueResolutionProvider> bindIssueResolutionProvider() {
		return AppModelDslQuickfixProvider.class;
	}
}