package com.games.funslot.controller 
{
	import com.games.funslot.enum.AssetID;
	import com.games.funslot.events.ApplicationEvent;
	import com.games.funslot.events.factories.LoadEventFactory;
	import com.games.funslot.model.api.IConfigModel;
	import com.games.funslot.model.api.IViewHierarchyModel;
	import com.games.funslot.service.api.IAssetProvider;
	import com.games.funslot.vo.LoadVO;
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	/**
	 * ...
	 * @author Leonid Trofymchuk
	 */
	public class LaunchAppCommand extends Command
	{
		[Inject]
		public var assetProvider:IAssetProvider;
		
		[Inject]
		public var configModel:IConfigModel;
		
		override public function execute():void
		{
			//Start load external assets
			assetProvider.addXML( new LoadVO(configModel.configURL, AssetID.CONFIG_XML) );
			assetProvider.load(LoadEventFactory.procedureConfigLoaded());
		}
		
	}

}