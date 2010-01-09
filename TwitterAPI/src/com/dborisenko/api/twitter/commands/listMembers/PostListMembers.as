/** PostListMembers.as
 * 
 * @author Denis Borisenko
 * 
 * Part of TwitterAPI project. Copyright (c) 2009.
 * http://code.google.com/p/twitter-actionscript-api/
 */
package com.dborisenko.api.twitter.commands.listMembers
{
	import com.dborisenko.api.twitter.net.ListOperation;
	
	/**
	 * Add a member to a list. The authenticated user must own the list to be able to add members to it. 
	 * Lists are limited to having 500 members.
	 * 
	 * @author Denis Borisenko
	 * @see http://apiwiki.twitter.com/Twitter-REST-API-Method%3A-POST-list-members
	 */
	public class PostListMembers extends ListOperation
	{
		protected static const URL:String = "http://api.twitter.com/1/{user}/{list_id}/members.xml";
		
		/**
		 * 
		 * @param listId					Required. The id or slug of the list.
		 * @param userIdToAddToList			Required. The id of the user to add as a member of the list.
		 * 
		 */
		public function PostListMembers(ownerUser:String, listId:String, userIdToAddToList:String)
		{
			super(URL.replace(/\{user\}/gi, ownerUser).replace(/\{list_id\}/gi, listId));
			resultFormat = RESULT_FORMAT_XML;
			method = METHOD_POST;
			_requiresAuthentication = true;
			_apiRateLimited = false;
			parameters = {list_id: listId, id: userIdToAddToList};
		}
	}
}