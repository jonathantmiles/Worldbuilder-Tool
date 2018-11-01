//
//  CampaignTableViewController.swift
//  Worldbuilder Tool
//
//  Created by Jonathan T. Miles on 11/1/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class CampaignTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CampaignController.shared.campaigns.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CampaignCell", for: indexPath)

        let campaign = CampaignController.shared.campaigns[indexPath.row]
        
        cell.textLabel?.text = campaign.name
        cell.detailTextLabel?.text = campaign.campaignType
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? CampaignDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
        
        if segue.identifier == "ShowCampaignDetail" {
            destVC.campaign = CampaignController.shared.campaigns[indexPath.row]
        } else if segue.identifier == "AddNewCampaign" {
            destVC.campaign = nil
        }
    }

}
