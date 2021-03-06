//
//  AgentsTableViewController.swift
//  PagoEfectivoSDKSample
//
//  Created by gerardo on 16/10/17.
//  Copyright © 2017 Orbis. All rights reserved.
//

import UIKit

class MobilePaymentMethodTableViewController: UITableViewController {

    @IBOutlet weak var numberCip: UILabel!
    @IBOutlet weak var mountCip: UILabel!
    @IBOutlet weak var dateExpiryCip: UILabel!
    var dataCip = DataCip()

    override func viewDidLoad() {
        print(dataCip.numberCip)
        numberCip.text = String(dataCip.numberCip)
        mountCip.text = "$" + String(dataCip.amountCip)
        if (dataCip.currencyCip == "PEN") {
            mountCip.text = "S/.\(String(dataCip.amountCip))"
        }
        dateExpiryCip.text = Help.getFormatterEvent(dateString: dataCip.dateExpiryCip)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 1) {
            performSegue(withIdentifier: Global.Segue.showSummary, sender: self)
        } else {
            self.present(Help.simpleAlert(message: "Opción no válida", time: 1.5), animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Global.Segue.showSummary) {
            guard let nextView = segue.destination as? SummaryViewController else {
                return
            }
            nextView.dataCip = dataCip
        }
    }
}
