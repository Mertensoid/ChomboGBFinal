//
//  NewToolViewController.swift
//  ChomboGBFinal
//
//  Created by admin on 26.01.2023.
//

import UIKit

final class NewToolViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Public properties
    
    var presenter: NewToolViewOutputDelegate?
    var bottomConstraint: NSLayoutConstraint? 
    var categoryToolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = UIBarStyle(rawValue: 0)!
        return toolBar
    }()
    var dateToolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = UIBarStyle(rawValue: 0)!
        return toolBar
    }()
    var conditionToolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = UIBarStyle(rawValue: 0)!
        return toolBar
    }()
    var categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = ColorConstants.baseWhite
        picker.setValue(ColorConstants.baseBlack, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        return picker
    }()
    var datePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = ColorConstants.baseWhite
        picker.setValue(ColorConstants.baseBlack, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        return picker
    }()
    var conditionPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = ColorConstants.baseWhite
        picker.setValue(ColorConstants.baseBlack, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        return picker
    }()
    
    // MARK: - Private properties
    
    private let headerView: NewToolHeaderView = {
        let headerView = NewToolHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        headerView.activateConstraints()
        return headerView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.activateConstraints()
        return scrollView
    }()
    private let pictureView: NewToolPictureView = {
        let pictureView = NewToolPictureView()
        pictureView.activateConstraints()
        return pictureView
    }()
    private let categoryPickerView: NewToolPickerView = {
        let categoryPickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Category")
        categoryPickerView.activateConstraints()
        return categoryPickerView
    }()
    private let brandTextView: NewToolTextView = {
        let brandTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Brand")
        brandTextView.activateConstraints()
        return brandTextView
    }()
    private let modelTextView: NewToolTextView = {
        let modelTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Model")
        modelTextView.activateConstraints()
        return modelTextView
    }()
    private let serialTextView: NewToolTextView = {
        let serialTextView = NewToolTextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), textLabelText: "Serial")
        serialTextView.activateConstraints()
        return serialTextView
    }()
    private let datePickerView: NewToolPickerView = {
        let datePickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Date")
        datePickerView.activateConstraints()
        return datePickerView
    }()
    private let conditionPickerView: NewToolPickerView = {
        let conditionPickerView = NewToolPickerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), pickerLabelText: "Condition")
        conditionPickerView.activateConstraints()
        return conditionPickerView
    }()
    private let addButton: UIButton = {
        let addButton = UIButton()
        addButton.activateConstraints()
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = ColorConstants.darkYellow
        addButton.layer.cornerRadius = 25
        addButton.setOpacity()
        addButton.makeTapWithButtonShadow()
        return addButton
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        datePicker.delegate = self
        datePicker.dataSource = self
        conditionPicker.delegate = self
        conditionPicker.dataSource = self
        
        bottomConstraint = NSLayoutConstraint(item: addButton, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: -10)
        
        addViews()
        configureConstraints()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    // MARK: - Public functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case categoryPicker:
            switch row {
            case 0:
                return MockCategory.handTools.rawValue
            case 1:
                return MockCategory.electroTools.rawValue
            case 2:
                return MockCategory.gasolineTools.rawValue
            case 3:
                return MockCategory.miscellaneous.rawValue
            default:
                return MockCategory.miscellaneous.rawValue
            }
        case conditionPicker:
            switch row {
            case 0:
                return MockCondition.excellent.rawValue
            case 1:
                return MockCondition.good.rawValue
            case 2:
                return MockCondition.normal.rawValue
            case 3:
                return MockCondition.broken.rawValue
            default:
                return MockCondition.broken.rawValue
            }
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case categoryPicker:
            presenter?.setCategory(row: row)
        case datePicker:
            presenter?.setDate()
        case conditionPicker:
            presenter?.setCondition(row: row)
        default:
            return
        }
    }
    
    // MARK: - Private functions
    
    private func addViews() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(pictureView)
        scrollView.addSubview(categoryPickerView)
        scrollView.addSubview(brandTextView)
        scrollView.addSubview(modelTextView)
        scrollView.addSubview(serialTextView)
        scrollView.addSubview(datePickerView)
        scrollView.addSubview(conditionPickerView)
        view.addSubview(addButton)
    }
    
    private func configureConstraints() {

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 100),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            pictureView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            pictureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            pictureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            pictureView.heightAnchor.constraint(equalToConstant: 165),
            
            categoryPickerView.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: 10),
            categoryPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            categoryPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            categoryPickerView.heightAnchor.constraint(equalToConstant: 50),
            
            brandTextView.topAnchor.constraint(equalTo: categoryPickerView.bottomAnchor, constant: 10),
            brandTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            brandTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            brandTextView.heightAnchor.constraint(equalToConstant: 70),
            
            modelTextView.topAnchor.constraint(equalTo: brandTextView.bottomAnchor, constant: 10),
            modelTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            modelTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            modelTextView.heightAnchor.constraint(equalToConstant: 70),
            
            serialTextView.topAnchor.constraint(equalTo: modelTextView.bottomAnchor, constant: 10),
            serialTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            serialTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            serialTextView.heightAnchor.constraint(equalToConstant: 70),
            
            datePickerView.topAnchor.constraint(equalTo: serialTextView.bottomAnchor, constant: 10),
            datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            datePickerView.heightAnchor.constraint(equalToConstant: 50),
            
            conditionPickerView.topAnchor.constraint(equalTo: datePickerView.bottomAnchor, constant: 10),
            conditionPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            conditionPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            conditionPickerView.heightAnchor.constraint(equalToConstant: 50),
            conditionPickerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            addButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            bottomConstraint!
        ])
    }
    
    private func configureViews() {

        view.backgroundColor = ColorConstants.baseWhite
        
        headerView.leftHeaderButton.addTarget(self, action: #selector(goToCatalogScreen), for: .touchUpInside)
        
        categoryPickerView.pickerButton.addTarget(self, action: #selector(categoryPickerPressed), for: .touchUpInside)
        
        datePickerView.pickerButton.addTarget(self, action: #selector(datePickerPressed), for: .touchUpInside)
        
        conditionPickerView.pickerButton.addTarget(self, action: #selector(conditionPickerPressed), for: .touchUpInside)
        
        categoryToolBar.items = [UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneCategoryButtonTapped))]
        
        dateToolBar.items = [UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneDateButtonTapped))]
        
        conditionToolBar.items = [UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onDoneConditionButtonTapped))]

        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    }
    
    @objc private func goToCatalogScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addButtonPressed() {
        presenter?.saveNewTool()
    }
    
    @objc private func onDoneCategoryButtonTapped() {

        presenter?.setCategory(row: categoryPicker.selectedRow(inComponent: 0))
        categoryToolBar.removeFromSuperview()
        categoryPicker.removeFromSuperview()
    }
    
    @objc private func onDoneDateButtonTapped() {

        presenter?.setDate()
        dateToolBar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    @objc private func onDoneConditionButtonTapped() {

        presenter?.setCondition(row: conditionPicker.selectedRow(inComponent: 0))
        conditionToolBar.removeFromSuperview()
        conditionPicker.removeFromSuperview()
    }
    
    @objc private func categoryPickerPressed() {
        hideKeyboard()
        self.view.addSubview(categoryPicker)
        self.view.addSubview(categoryToolBar)
    }
    
    @objc private func datePickerPressed() {
        hideKeyboard()
        self.view.addSubview(datePicker)
        self.view.addSubview(dateToolBar)
    }
    
    @objc private func conditionPickerPressed() {
        hideKeyboard()
        self.view.addSubview(conditionPicker)
        self.view.addSubview(conditionToolBar)
    }
}

extension NewToolViewController: NewToolViewInputDelegate {

    func showCategory(category: MockCategory) {
        self.categoryPickerView.setData(data: category.rawValue)
    }

    func showDate(date: String) {
        self.datePickerView.setData(data: "")
    }
    
    func showCondition(condition: MockCondition) {
        self.conditionPickerView.setData(data: condition.rawValue)
    }
    
    func getCategory() -> MockCategory {
        switch categoryPickerView.getData() {
        case "Hand tools":
            return MockCategory.handTools
        case "Electro tools":
            return MockCategory.electroTools
        case "Gasoline tools":
            return MockCategory.gasolineTools
        default:
            return MockCategory.miscellaneous
        }
    }
    
    func getBrand() -> String {
        return brandTextView.getData()
    }
    
    func getModel() -> String {
        return modelTextView.getData()
    }
    
    func getSerial() -> String {
        return serialTextView.getData()
    }

    func getCondition() -> MockCondition {
        switch conditionPickerView.getData() {
        case "Excellent":
            return MockCondition.excellent
        case "Good":
            return MockCondition.good
        case "Normal":
            return MockCondition.normal
        default:
            return MockCondition.broken
        }
    }
}

@objc extension NewToolViewController {
    
    private func keyboardWasShown(notification: Notification) {
        
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        bottomConstraint?.constant = -10 - kbSize.height + (tabBarController?.tabBar.frame.height ?? 0)
        
        UIView.animate(withDuration: 1) {
            self.addButton.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.addButton.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
    
    private func keyboardWillBeHidden(notification: Notification) {
        
        bottomConstraint?.constant = -10
        UIView.animate(withDuration: 1) {
            self.addButton.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.addButton.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
